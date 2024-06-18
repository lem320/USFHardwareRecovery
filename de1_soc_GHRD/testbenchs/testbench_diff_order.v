`timescale 1ns/1ps

module testbench_diff_order (
	output wire[15:0] N
);

	reg clk = 1'b0;
	reg en = 1'b1;
	
	reg[11:0] in = 12'd10;
	
	
	diff_order_calculator U0 (
		.clk_50(clk),
		.en(en),
		.L_mV(in),
		.N(N)
	);
	
	
	always
		#10 clk <= ~clk; // 50MHz
	
	always
		#400 in <= in + 12'd10;


endmodule