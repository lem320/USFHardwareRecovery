module fold_remover (
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
	wire thresholded [rows-1:0];

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
			assign thresholded[z] = |(ABS_D_in[z][OUT_RES-1:B]);
		end
	endgenerate
	
	reg state = 0;
	reg[5:0] n = J+1;
	reg signed [5:0] start_index = 0;
	
	function [OUT_RES-1:0] DIVIDE (input[OUT_RES-1:0] a, input[5:0] b);
		case (b)
			3'd1: return (a);
			3'd2: return (a >>> 1);
			3'd3: return ((a >>> 2) + (a >>> 4) + (a >>> 6));
			3'd4: return (a >>> 2);
			3'd5: return ((a >>> 3) + (a >>> 4) + (a >>> 6));
		endcase
	endfunction
	
	function [OUT_RES-1:0] MULTIPLY (input[OUT_RES-1:0] a, input[5:0] b);
		case (b)
			3'd1: return a;
			3'd2: return a + a;
			3'd3: return a + a + a;
			3'd4: return a + a + a + a;
			3'd5: return a + a + a + a + a;
		endcase
	endfunction
	
	wire signed [OUT_RES-1:0] start_value = (start_index==-1 ? (D_in[start_index+1][15] ? -L : L) : in[start_index]);
	
	wire signed [OUT_RES-1:0] gap = in[n] - start_value + (start_index==-1 ? 0 : (D_in[start_index+1][15] ? 2*L : -2*L));
	wire signed [OUT_RES-1:0] step = DIVIDE(gap,(n-start_index));
	
	wire signed [OUT_RES-1:0] gap2 = (D_in[start_index+1][15] ? L : -L) - start_value;
	wire signed [OUT_RES-1:0] step2 = DIVIDE(gap2,(n-start_index));
		
		
		
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
			if (!state && thresholded[n] && !first_cycle) begin
				if (n != J) begin
					state <= 1'b1;
					start_index <= n-1;
					out[n] <= in[n];
				end
				else
					out[n] <= (D_in[n][15] ? L : -L);
			end
			else if (state && !thresholded[n]) begin
				state <= 1'b0;
				out[n] <= in[n];
				
				// This method removed this error
				// Error (10119): Verilog HDL Loop Statement error at fold_remover.sv(77): loop with non-constant loop condition must terminate within 250 iterations
				// Error (10251): Verilog HDL error at fold_remover.sv(85): index 19 cannot fall outside the declared range [18:0] for dimension 0 of array "out"

				for (i=0; i<J+1; i=i+1)
					if (i >= start_index+1 && i<n)
						out[i] <= CMOD_L(start_value + MULTIPLY(step,i-start_index));
			end
			
			else if (state && n == J) begin
				state <= 1'b0;
				for (i=0; i<J+1; i=i+1) // was i < n
					if (i >= start_index+1)
						out[i] <= CMOD_L(start_value + MULTIPLY(step2,i-start_index));
			end
			else
				out[n] <= in[n];
			
			n <= n + 1'b1;
		end
	end
		

endmodule