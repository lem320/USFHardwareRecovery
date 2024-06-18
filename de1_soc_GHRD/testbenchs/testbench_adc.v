`timescale 1ns/1ps

module testbench_adc (sys_clk, wd, w);

output reg sys_clk;
output wire[31:0] wd;
output wire w;

reg[3:0] k;

reg reset, dout, mode;
wire sclk, cs_n, din;

wire c;

wire[11:0] reading0, reading1, reading2;



ltc2308 ADC (
		.clk_50(sys_clk),
//		.reset(reset),
		.sck(sclk),
		.cs(cs_n),
		.mosi(din),
		.miso(dout),
		.reading0(reading0),
		.reading1(reading1),
		.reading2(reading2),
		.mode_in(mode)
);

//adc_wrapper AW (
//	.clk(sys_clk),
//	.reset(1'b0),
//	.sck(sclk),
//	.cs(cs_n),
//	.dout(dout),
//	.din(din),
//	.key(k),
//	.fifo_in_writedata(wd),
//	.fifo_in_write(w),
//	.counter(c)
//);




always
	#10 sys_clk <= ~sys_clk; // 50MHz
	
always
	#130 dout <= ~dout;
	
always
	#3000 mode <= ~mode;
	
//always
//	#2000 k[0] <= ~k[0];
	
initial
begin

	sys_clk <= 1'b1;
	reset <= 1'b0;
	dout <= 1'b0;
	k[0] <= 1'b0;
	mode <= 1'b1;

end
endmodule