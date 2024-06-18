module loop_block (clk, reset, en, res, out);

//	`include "parameters.sv"
	`include "functions.sv"

	integer i;

	input clk, reset, en;
	input [OUT_RES-1:0] res;
	output reg [OUT_RES-1:0] out;

	reg[N-1:0] antidiff_en;
	reg[OUT_RES-1:0] s [N-1:0];
	reg[OUT_RES-1:0] Ss [N-1:0];
	
	initial
		for (i=0; i<N; i = i+1) begin
			antidiff_en[i] <= 1'b0;
			s[i] <= (OUT_RES)'('b0);
		end

	antidiff_operator #(
		.order(1)
	) ANTIDIFF[N-1:0] (
		.clk(~clk),
		.reset(reset),
		.en(antidiff_en),
		.y(s),
		.out(Ss)
	);
	
	
	reg[N_bits:0] iteration = N;
	reg[1:0] counter = 0;
	
	always @ (posedge clk)
		if (en || (iteration > 0 && iteration <= N)) begin
		
			if (iteration == 0)
				s[0] <= ROUND_2L(res);
			else if (iteration != N)
				s[iteration] <= ROUND_2L(Ss[iteration-1]);
			else begin
				out <= ROUND_2L(Ss[N-1]);
				iteration <= 1'b0;
			end
			
			if (iteration != N) begin
				iteration <= iteration + 1'b1;
				antidiff_en[iteration] <= 1'b1;
			end
				
			if (iteration != 0)
				antidiff_en[iteration-1] <= 1'b0;

		end
		
//		if (en) begin
//			antidiff_en[0] <= 1'b1;
//			s[0] <= ROUND_2L(res);
//			iteration <= 1'b1;
//		end
//			
//		else if (iteration <= N) begin
//			antidiff_en[iteration-1] <= 1'b0;
//			iteration <= iteration + 1'b1;
//			
//			if (iteration <= N-1) begin
//				antidiff_en[iteration] <= 1'b1;
//				s[iteration] <= ROUND_2L(Ss[iteration-1]);
//			end
//			else 
//				out <= ROUND_2L(Ss[N-1]);
//		end
		

endmodule