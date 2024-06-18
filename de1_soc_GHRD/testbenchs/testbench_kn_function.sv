`timescale 1ns/1ps

module testbench_kn_function ();

//	localparam signed  [15:0] arr [12:0] = '{
//		0:16'd1,
//		1:16'd4,
//		2:16'd7,
//		3:-16'd5,
//		4:-16'd3,
//		5:16'd0,
//		6:16'd2,
//		7:16'd4,
//		8:16'd6,
//		9:16'd5,
//		10:16'd4,
//		11:16'd3,
//		12:16'd2
//	};
	
	localparam signed  [15:0] arr [12:0] = '{
		0:16'd0,
		1:16'd8,
		2:-16'd16,
		3:16'd8,
		4:16'd8,
		5:-16'd16,
		6:16'd8,
		7:16'd8,
		8:-16'd16,
		9:16'd8,
		10:16'd0,
		11:-16'd8,
		12:16'd16
	};
	
//	localparam signed  [15:0] arr [12:0] = '{
//		0:16'd0,
//		1:16'd8,
//		2:-16'd16,
//		3:16'd8,
//		4:16'd8,
//		5:-16'd16,
//		6:16'd8,
//		7:16'd8,
//		8:-16'd16,
//		9:16'd8,
//		10:16'd0,
//		11:-16'd8,
//		12:16'd16
//	};
	
//	
//	  0
//     0
//     8
//    -8
//     0
//     8
//    -8
//     0
//     8
//    -8
//     0
//     0
//    -8
//     8
//	
//	  0	
//     0
//     0
//     8
//     0
//     0
//     8
//     0
//     0
//     8
//     0
//     0
//     0
//    -8
//     0
	
	integer i;

	reg clk = 1'b1;
	reg en = 1'b0;
	
	reg[15:0] in = 16'd1;
	wire[15:0] out;
	
	kn_function U0 (
		.clk(clk),
		.en(en),
		.reset(1'b0),
		
		.Dn_res(arr),
		.Kn(out)
	);
	
	
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
			#780 en <= 1'b1;
		end
	end



endmodule