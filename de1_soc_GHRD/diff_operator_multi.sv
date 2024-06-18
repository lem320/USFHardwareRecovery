module diff_operator_multi (
	clk, reset, en,
	in, out
);

	`include "functions.sv"

	parameter rows = J+1;
	parameter columns = N;
	parameter column_bits = $clog2(columns);
	
	
	input clk, reset, en;

	input signed [OUT_RES-1:0] in [rows-1:0];

	output wire signed [OUT_RES-1:0] out [rows-1:0];

	
	integer i,j;

	reg signed [OUT_RES-1:0] shift  [rows-1:0][columns:1];
	reg signed [OUT_RES-1:0] carrys [columns-1:0];
	
	reg[column_bits+1:0] counter = columns+1;
	
	genvar z;
	generate
		for (z=0; z<rows; z=z+1) begin : set_out
			assign out[z] = shift[z][columns];
		end
	endgenerate
	
	initial begin
		for (i=0; i<rows; i=i+1)
			for (j=1; j<=columns; j = j+1)
				shift[i][j] <= (OUT_RES)'('b0);
		
		for (i=0; i<columns; i=i+1)
			carrys[i] <= (OUT_RES)'('b0);
	end
	
	reg first_cycle = 1'b1;
	
	always @ (posedge clk) begin
	
		// Reset shift register to 0s
		if (reset) begin
			for (i=0; i<rows; i=i+1) begin
				for (j=1; j<=columns; j=j+1) begin
					shift[i][j] <= (OUT_RES)'('b0);
				end
			end
					
			for (i=0; i<columns; i=i+1) begin
				carrys[i] <= (OUT_RES)'('b0);
			end
			
			first_cycle <= 1'b1;
		end
				
		
		// Populate first column (1st order)
		else if (en) begin
		
			// Error (10119): Verilog HDL Loop Statement error at diff_operator_multi.sv(65): loop with non-constant loop condition must terminate within 250 iterations
			// to comabat this error
			for (i=0; i<rows; i=i+1) begin
				if (!(i==0 && first_cycle))
					shift[i][1] <= in[i] - (i==0 ? carrys[0] : in[i-1]);
			end
				
			counter <= 2'd2;
			
			
			if (columns==1) begin
				carrys[0] <= in[rows-1];
				first_cycle <= 1'b0;
			end
		end
		
		
		// Populate each subsiquent column (counter-th order)
		else if (counter <= columns) begin
			for (i=0; i<rows; i = i+1) begin
				if (!(i==0 && first_cycle))
					shift[i][counter] <= shift[i][counter-1] - (i==0 ? carrys[counter-1] : shift[i-1][counter-1]);
			end

			counter <= counter + 1'b1;
		end
		
		// Set carry values
		if (counter==2 && columns > 1) begin
			carrys[0] <= in[rows-1];
			
		end
		if (counter==columns) begin
			for (i=1; i<columns; i++)
				carrys[i] <= shift[rows-1][i];
			first_cycle <= 1'b0;
		end
	end
	
endmodule