`include "functions.sv"

module diff_operator (clk,reset,en,y,out);
				
	parameter max_order;
	parameter max_order_bits = $clog2(max_order);

	integer i,j;
	
	input clk;
	input reset;
	input en;

	input signed [OUT_RES-1:0] y;

	output reg signed [OUT_RES-1:0] out [max_order:1];
	
	reg signed [OUT_RES-1:0] shift [max_order:0][max_order-1:0];
	reg[max_order_bits+1:0] counter = max_order+1;
	
	initial
		for (i=0; i<max_order; i = i+1)
			for (j=0; j<max_order; j = j+1)
				shift[i][j] <= (OUT_RES)'('b0);
	
	
	always @ (posedge clk)
	
		// Reset shift register to 0s
		if (reset) begin
			for (i=0; i<=max_order; i = i+1)
				for (j=0; j<max_order; j = j+1)
					shift[i][j] <= (OUT_RES)'('b0);
		end
		
		// Populate first column (0th max_order)
		else if (en) begin
			shift[0][0] <= y;
			for (i=1; i<=max_order; i = i+1)
				shift[i][0] <= shift[i-1][0];
				
			counter <= 1'b1;
		end
		
		// Populate each subsiquent column (counter-th max_order)
		else if (counter <= max_order) begin
			for (i=1; i<=max_order; i = i+1) begin
			
				// Don't need extra column of shift for max_order-th order
				if (counter < max_order)
					shift[i][counter] <= shift[i-1][counter-1'b1] - shift[i][counter-1'b1];
				
				if (i==counter)
					out[i] <= shift[i-1][counter-1'b1] - shift[i][counter-1'b1];
			end
			
			counter <= counter + 1'b1;
		end
			
endmodule