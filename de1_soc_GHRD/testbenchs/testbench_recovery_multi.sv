`timescale 1ns/1ps

module testbench_recovery_multi ();

	localparam signed  [11:0] arr [12:0] = '{
		0:12'd1,
		1:12'd8,
		2:12'd19,
		3:12'd25,
		4:12'd10,
		5:12'd1,
		6:12'd9,
		7:12'd13,
		8:12'd20,
		9:12'd23,
		10:12'd30,
		11:12'd10,
		12:12'd10
	};
	
	
	integer i;

	reg clk = 1'b1;
	reg en = 1'b0;
	
	reg[15:0] in =12'd0;
	wire[15:0] out [12:0];
	
	usf_recovery_multi U0 (
		.clk(clk),
		.en(en),
		.reset(1'b0),
		
		.in(arr),
		.out(out)
	);
	
//	tb_rom ROM (
//		.address(),
//		.clock(clk),
//		.q()
//	);
	
	
	always
		#10 clk <= ~clk; // 50MHz
	
	initial begin
		#100;
		for (i = 0; i<=10; i = i + 1) begin
			in <= arr[i];
			#200;
		end
	end
	
	initial begin
		#10;
		forever begin
			#20 en <= 1'b0;
			#980 en <= 1'b1;
		end
	end



endmodule