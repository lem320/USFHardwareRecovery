module antidiff_operator_multi_fast (
	clk, reset, en,
	in, out
);

	`include "functions.sv"

	parameter rows = J+1;
	parameter row_bits   = $clog2(rows);

	parameter columns = 1;
	parameter column_bits = $clog2(columns);
	
	
	input clk, reset, en;

	input[OUT_RES-1:0] in [rows-1:0];
	output wire signed [OUT_RES-1:0] out [rows-1:0];


	integer i, j;

	reg signed [OUT_RES-1:0] shift  [rows-1:0][columns:1];
	reg signed [OUT_RES-1:0] carrys [columns:1];
	
	reg[column_bits+1:0] counter_column = 1;
	
	
	genvar z;
	generate
		for (z=0; z<rows; z=z+1) begin : set_out
			assign out[z] = shift[z][columns];
		end
	endgenerate
	

	// Set all registers to 0s
	initial begin
		for (j=1; j<=columns; j=j+1)
			for (i=0; i<rows; i=i+1)
				shift[i][j] <= (OUT_RES)'('b0);
				
		for (j=1; j<=columns; j=j+1) begin
			carrys[j] <= (OUT_RES)'('b0);
		end
	end
	
	always @ (posedge clk)
	
		if (reset) begin
			for (j=1; j<=columns; j=j+1) begin
				for (i=0; i<rows; i=i+1) begin
					shift[i][j] <= (OUT_RES)'('b0);
				end
			end
			
			for (j=1; j<=columns; j=j+1) begin
				carrys[j] <= (OUT_RES)'('b0);
			end
		end
	
		else if (en || (counter_column > 1 && counter_column <= columns)) begin
		
			for (int i=0; i<rows; i=i+1) begin
				shift[i][counter_column] = carrys[counter_column];
				for (int j=0; j<=i; j=j+1) begin
					shift[i][counter_column] = shift[i][counter_column] + (en ? in[j] : shift[j][counter_column-1]);
				end
			end

			// Set counter for next clock cyle
			counter_column <= (counter_column==columns ? 2'd1 : counter_column + 1);
		end
		
		else
			for (j=1; j<=columns; j=j+1) begin
				carrys[j] <= shift[rows-1][j];
			end
			
endmodule