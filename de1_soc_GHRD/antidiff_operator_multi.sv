module antidiff_operator_multi (
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
	
	reg[row_bits+1:0]   counter_row    = rows;
	reg[column_bits+1:0] counter_column = columns;
	

	initial begin
		for (j=1; j<=columns; j=j+1)
			for (i=0; i<rows; i=i+1)
				shift[i][j] <= (OUT_RES)'('b0);
				
		for (j=1; j<=columns; j=j+1)
			carrys[j] <= (OUT_RES)'('b0);
	end
	
	genvar z;
	generate
		for (z=0; z<rows; z=z+1) begin : set_out
			assign out[z] = shift[z][columns];
		end
	endgenerate
	
	always @ (posedge clk)
	
		if (reset) begin
			for (j=1; j<=columns; j=j+1)
				for (i=0; i<rows; i=i+1)
					shift[i][j] <= (OUT_RES)'('b0);
					
			for (j=1; j<=columns; j=j+1)
				carrys[j] <= (OUT_RES)'('b0);
		end
	
	
		else if (en) begin
			if (columns==1) begin
//				out[0]      <= carrys[1] + in[0];
				shift[0][1] <= carrys[1] + in[0];
				counter_column <= 1'b1;
				counter_row    <= 1'b1;
			end
			else begin
				shift[0][1] <= carrys[1] + in[0];
				counter_column <= 1'b1;
				counter_row    <= 1'b1;
			end
			
		end
		
		else if (counter_row < rows && counter_column <= columns) begin
//			if (counter_column==columns) begin
////				if (columns==1)
////					out[counter_row] <= out[counter_row-1] + in[counter_row];
////				else
////					out[counter_row] <= (counter_row==0 ? carrys[counter_column] : out[counter_row-1]) + shift[counter_row][counter_column-1];
////			
//
//				counter_column <= 1'b1;
//				counter_row    <= counter_row + 1'b1;
//			end
//			else
//				counter_column <= counter_column + 1'b1;

			if (counter_row==rows-1) begin
				counter_row    <= 1'b0;
				counter_column <= counter_column + 1'b1;
			end
			else
				counter_row <= counter_row + 1'b1;
				
			
			
				
			shift[counter_row][counter_column] <= (
				(counter_row==0     ? carrys[counter_column] : shift[counter_row-1][counter_column]) +
				(counter_column==1  ? in[counter_row]        : shift[counter_row][counter_column-1])
			);
				
//			if (counter_column==1)
//				shift[counter_row][counter_column] <= (counter_row==0 ? carrys[counter_column]: shift[counter_row-1][counter_column]) + in[counter_row];
//			else
//				shift[counter_row][counter_column] <= (counter_row==0 ? carrys[counter_column]: shift[counter_row-1][counter_column]) + shift[counter_row][counter_column-1];
	
//			if (counter_row == rows-1)
//				carrys[counter_column] <= shift[rows-1][counter_column];
		end
		else if (counter_row==0 && counter_column==columns+1)
			for (j=1; j<=columns; j=j+1)
				carrys[j] <= shift[rows-1][j];

endmodule