`include "functions.sv"


module antidiff_operator (
	input clk,
	input reset,
	input en,

	input[OUT_RES-1:0] y,
	
	output wire[OUT_RES-1:0] out
);

//	`include "parameters.sv"	

	parameter order_bits = 2;
	parameter order = 1;
	integer i;

	reg signed [OUT_RES-1:0] shift [order-1:0];
	reg[order_bits+1:0] counter = order;
	
	assign out = shift[order-1];


	initial
		for (i=0; i<order; i = i+1)
			shift[i] <= (OUT_RES)'('b0);
	
	always @ (posedge clk)
	
		if (reset)
			for (i=0; i<order; i = i+1)
				shift[i] <= (OUT_RES)'('b0);
	
		else if (en) begin
			shift[0] <= shift[0] + y;
			
			counter <= 1'b1;
		end
		
		else if (counter < order) begin
			for (i=1; i<order; i = i+1)
				shift[i] <= shift[i] + shift[i-1];
				
			counter = counter + 1'b1;
		end


endmodule