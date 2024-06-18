module loop_block_multi (
	clk, reset, en,
	in, out,
	k_found
);

	`include "functions.sv"

	parameter rows = J+1;
	parameter columns = N;

	parameter row_bits   = $clog2(rows);
	parameter column_bits = $clog2(columns);


	input clk, reset, en;
	input signed [OUT_RES-1:0] in [rows-1:0];
	
	output wire signed [OUT_RES-1:0] out [rows-1:0];
	output reg k_found = 0;


	integer i, j;

	reg[columns-2:0] antidiff_en;
	reg[columns-2:0] kn_calc_en;

	reg signed [OUT_RES-1:0] s [columns-1:0][rows-1:0];
	
	
	initial begin
		for (j=0; j<=columns-2; j=j+1) begin
			antidiff_en[j] <= 1'b0;
			kn_calc_en[j] <= 1'b0;
		end
		
		for (j=0; j<=columns-1; j=j+1) begin
			for (i=0; i<rows; i = i+1)
				s[j][i]  <= (OUT_RES)'('b0);
		end
	end

	wire signed [OUT_RES-1:0] Ss [columns-2:0][rows-1:0];
	wire signed [OUT_RES-1:0] k [columns-2:0];
	wire signed [OUT_RES-1:0] Dn_res [columns-2:0][rows-1:0];
	
	genvar z;
	generate
		for (z=0; z<=columns-2; z=z+1) begin : set_Dn_res
			assign Dn_res[z] = s[z];
		end
			
		for (z=0; z<rows; z=z+1) begin : set_out
			assign out[z] = s[columns-1][z];
		end
	endgenerate
	
	antidiff_operator_multi ANTIDIFF[columns-2:0] (
		.clk(~clk),
		.reset(reset),
		.en(antidiff_en),
		.in(s[columns-2:0]),
		.out(Ss)
	);
	

	kn_function KN_CALC[columns-1:1] (
		.clk(clk),
		.en(kn_calc_en),
		.reset(reset),
		.Dn_res(Dn_res),
		.Kn(k)
	);
	
	
	reg[column_bits:0] n = 0;
	reg[5:0]           k_delay = 0;
	reg[5:0]           antidiff_delay = 0;
	
	parameter IDLE = 2'd0, FIND_K = 2'd1, ANTIDIFF_WAIT = 2'd2, ITERATE = 2'd3;
	reg[1:0] state = IDLE;
	
	always @ (posedge clk) begin
	
		if (reset) begin
			for (j=0; j<=columns-2; j=j+1) begin
				antidiff_en[j] <= 1'b0;
				kn_calc_en[j] <= 1'b0;
			end
			
			for (j=0; j<=columns-1; j=j+1) begin
				for (i=0; i<rows; i = i+1)
					s[j][i]  <= (OUT_RES)'('b0);
			end
			
			k_found <= 1'b0;
		end
		
		else		
	
			case (state)
				IDLE: begin
					if (en) begin
						state <= (k_found ? ANTIDIFF_WAIT : FIND_K);
						for (i=0; i<rows; i=i+1)
							s[0][i] <= ROUND_2L(in[i]);
						antidiff_en[0] <= 1'b1;
					end
				end
				
				FIND_K: begin
					kn_calc_en[n] <= (k_delay == 0 ? 1'b1 : 1'b0);
					
					if (k_delay == 6+FIRST_ORDER_ANTIDIFF_DELAY) begin
						k_delay <= 1'b0;
						state <= ANTIDIFF_WAIT;
					end
					else
						k_delay <= k_delay + 1'b1;
					
					antidiff_en[n] <= 1'b0;
				end
				
				ANTIDIFF_WAIT: begin
					if (antidiff_delay < FIRST_ORDER_ANTIDIFF_DELAY)
						antidiff_delay <= antidiff_delay + 1'b1;
					else begin
						state <= ITERATE;
						antidiff_delay <= 5'b0;
					end
					
					antidiff_en[n] <= 1'b0;
				end
				
				ITERATE: begin
					for (i=0; i<rows; i=i+1)
						s[n+1][i] <= ROUND_2L(Ss[n][i]) + (k[n] <<< (B+1));
					
					if (n != columns-2) begin
						n <= n + 1'b1;
						antidiff_en[n+1] <= 1'b1;
						
						if (!k_found)
							state <= FIND_K;
						else
							state <= ANTIDIFF_WAIT;
					end
					else begin
						state <= IDLE;
						n <= 0;
						
						if (!k_found)
							k_found <= 1'b1;
					end
					
					antidiff_en[n] <= 1'b0;
				end
			endcase
	end

endmodule