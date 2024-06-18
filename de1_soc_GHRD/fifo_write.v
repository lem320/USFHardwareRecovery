module fifo_write (
	input clk,
	input cs,
	input mode,
	
	input[11:0] reading0,
	input[11:0] reading1,
	
	output reg[31:0] fifo_in_writedata,
	output reg fifo_in_write = 1'b0
);



	reg counter = 1'b0;
	always @ (posedge cs)
		counter = ~counter;
	
	reg new_cycle = 1'b1;
	always @ (posedge clk) begin
		if (!mode)
			if (!fifo_in_write && cs && new_cycle && counter == 1'b0) begin
				fifo_in_write <= 1'b1;
				fifo_in_writedata <= {4'd0,reading1,4'd0,reading0};
			end
			else if (fifo_in_write && cs && new_cycle && counter == 1'b0) begin
				fifo_in_write <= 1'b0;
				new_cycle <= 1'b0;
			end
			else if (!cs && !new_cycle)
				new_cycle <= 1'b1;
	end

endmodule