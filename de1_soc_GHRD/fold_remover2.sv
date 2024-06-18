module fold_remover2 (
	clk, reset, en,
	in, out
);

	`include "functions.sv"

	parameter rows = J+1;
	
	
	input clk, reset, en;
	
	input signed [OUT_RES-1:0] in [rows-1:0];
	output reg signed [OUT_RES-1:0] out [rows-1:0];
	

	integer i;

	initial
		for (i=0; i<rows; i=i+1)
			out[i] <= in[i];

	wire signed [OUT_RES-1:0] D_in [rows-1:0];
	wire [rows-1:0] thresholded;
	wire [rows+2:-3] thresholded_extended = {3'b000,thresholded,3'b000};
	wire [rows-1:0] thresholded2;

	diff_operator_multi DIFF (
		.clk(clk),
		.reset(reset),
		.en(en),
		.in(in),
		.out(D_in)
	);
	defparam DIFF.columns = 1;
	
	
	
	genvar z;
	wire signed [OUT_RES-1:0] ABS_D_in [rows-1:0];
	generate
		for (z=0; z<rows; z=z+1) begin : set_ABS_D_in
			assign ABS_D_in[z] = ABS(D_in[z]);
		end
		
		for (z=0; z<rows; z=z+1) begin : set_thresholded
			assign thresholded[z] = |(ABS_D_in[z][OUT_RES-1:9]);
		end
		
		for (z=0; z<rows; z=z+1) begin : set_thresholded2
			assign thresholded2[z] = |(thresholded_extended[z+1:z-1]);//thresholded_extended[z] | ((thresholded_extended[z+1]) & (thresholded_extended[z-1]));
		end
	endgenerate
	
	reg state = 0;
	reg[5:0] n = J+1;
	reg signed [5:0] start_index = 0;
		
	reg first_cycle = 1'b1;
	
	always @ (posedge clk) begin
		// DELAY BY 1 CLOCK CYCLE TO WAIT FOR DIFF
		if (reset) begin
			first_cycle <= 1'b1;
			state <= 1'b0;
		end
		
		if (en)
			n <= 0;
		if (n < J+1) begin
			first_cycle <= 1'b0;
			if (!state && thresholded2[n] && !first_cycle) begin
				if (n != J) begin
					state <= 1'b1;
					start_index <= n-1;
					out[n] <= in[n];
				end
				else
					out[n] <= (D_in[n][15] ? L : -L);
			end
			else if (state && !thresholded2[n]) begin
				state <= 1'b0;
				out[n] <= in[n];
				
				// This method removed this error
				// Error (10119): Verilog HDL Loop Statement error at fold_remover.sv(77): loop with non-constant loop condition must terminate within 250 iterations
				// Error (10251): Verilog HDL error at fold_remover.sv(85): index 19 cannot fall outside the declared range [18:0] for dimension 0 of array "out"
				for (i=0; i<J+1; i=i+1)
					if (i >= start_index+1 && i<n)
							out[i] <= -L;
			end
			
			else if (state && n == J) begin
				state <= 1'b0;
				for (i=0; i<J+1; i=i+1)
					out[i] <= -L;

			end
			else
				out[n] <= in[n];
			
			n <= n + 1'b1;
		end
	end
		

endmodule