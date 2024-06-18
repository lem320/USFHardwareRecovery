module fold_remover3 (
	clk, reset, en,
	in, out
);

	`include "functions.sv"

	parameter rows = J+1;
	
	
	input clk, reset, en;
	
	input signed [OUT_RES-1:0] in [rows-1+EXTRA_SAMPLES:0];
	output wire signed [OUT_RES-1:0] out [rows-1:0];
	

	integer i;

	wire signed [OUT_RES-1:0] D_in_tmp [rows-1:0];

	diff_operator_multi DIFF (
		.clk(clk),
		.reset(reset),
		.en(en),
		.in(in[rows-1:0]),
		.out(D_in_tmp)
	);
	defparam DIFF.columns = 1;
	
	wire signed [OUT_RES-1:0] D_in [rows-1+EXTRA_SAMPLES:-1];
	reg[OUT_RES-1:0] D_in_carry = 16'd0;
	reg[OUT_RES-1:0] out_carry = 16'd0;
	
	
	genvar z;
	generate
		for (z=rows; z<rows+EXTRA_SAMPLES; z=z+1) begin : D_in_set
			assign D_in[z] = in[z]-in[z-1];
		end
	
		for (z=0; z<rows; z=z+1) begin : D_in_set2
			assign D_in[z] = D_in_tmp[z];
		end
		assign D_in[-1] = D_in_carry;
	endgenerate

	
	reg state = 0;
	reg[5:0] n = J+1;
		
	reg[1:0] first_cycles = 2'd0;
	reg[2:0] last3 = 3'b000;
	wire avg_last3 = ((last3[0] & last3[1]) | (last3[1] & last3[2]) | (last3[0] & last3[2]));
	
	
	wire signed [OUT_RES-1:0] ABS_D_in [rows-1+EXTRA_SAMPLES:0];
	generate
		for (z=0; z<rows+EXTRA_SAMPLES; z=z+1) begin : set_ABS_D_in
			assign ABS_D_in[z] = ABS(D_in[z]);
		end
	endgenerate
	
	reg[5:0] start_index = 0;
	reg[J:0] set = 0;
	
	reg signed [OUT_RES-1:0] out_extended [rows-1+EXTRA_SAMPLES:0];
	assign out = out_extended[rows-1:0];
	reg[OUT_RES-1:0] diff1=0, diff2=0;
	
	
	always @ (posedge clk) begin
		// DELAY BY 1 CLOCK CYCLE TO WAIT FOR DIFF
		if (reset) begin
			first_cycles <= 2'd0;
			state <= 1'b0;
		end
		
		if (en)
			n <= 0;
		if (n < J+1) begin
//			out[n] <= in[n];

			if (n == J+1) begin
				D_in_carry <= D_in[rows-1];
				out_carry <= out_extended[rows-1];
			end
//				final_Value <= in[J];

			if (first_cycles < 1) begin
				
				if (|(ABS_D_in[n][OUT_RES-1:8]))
					last3[2:0] <= (3)'(~D_in[n-1][15]);
				else
					last3[2:0] <= (3)'(D_in[n-1][15]);
				
				out_extended[n] <= in[n];
			end
			else begin
				if (avg_last3 != D_in[n][15] && |(ABS_D_in[n][OUT_RES-1:9])) begin
				
					if (set[n]) begin
						set[n] <= 1'b0;
					end
					
				
					if (n != 0) begin
						if (avg_last3 != D_in[n-1][15]) begin
							out_extended[n-1] <= -L;//in[start_index];
						end
					end
					
						
					if (n != J) begin
						if (avg_last3 != D_in[n+1][15]) begin
								out_extended[n+1] <= -L;
							set[n+1] <= 1'b1;
						end
					end
					
					if (avg_last3 == D_in[n+1][15]) begin
						out_extended[n] <= in[n];
					end
					else begin
						out_extended[n] <= -L;
					end

				end
				
				else begin
					if (!set[n]) begin
						out_extended[n] <= in[n];
					end
					else
						set[n] <= 1'b0;
					last3[2:0] <= {last3[1:0],D_in[n][15]};
					state <= 1'b0;
				end
			end
		
			if (first_cycles<3)
				first_cycles <= first_cycles + 1'b1;
		
			n <= n + 1'b1;
		end
	end
		

endmodule