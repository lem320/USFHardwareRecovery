`timescale 1ns/1ps

module testbench_top ();

reg clk = 1'b0;
wire[31:0] wd;
wire w;

reg reset = 1'b0, dout, en = 1'b0;
wire sck, cs_n, din;

wire c;

wire[11:0] reading0, reading1;

wire[31:0] fifo_in_writedata;
wire fifo_in_Write;



usf_top USF (
		.clk(clk),
		.reset(reset),
		.en(en),
		
		.sck(sck),
		.cs(cs_n),
		.din(din),
		.dout(dout),
		
		.fifo_in_writedata(fifo_in_writedata),
		.fifo_in_write(fifo_in_write)
);

always
	#10 clk <= ~clk; // 50MHz
	
always
	#130 dout <= ~dout;
	
//always
//	#30000 mode <= ~mode;

initial
	dout <= 1'b0;

initial begin
	en <= 1'b1;
	
//	#200000
//	en <= 1'b1;
//	#200000
//	en <= 1'b0;
//	#100000
//	en <= 1'b1;
//	#700000
//	en <= 1'b0;
end
	
	
endmodule