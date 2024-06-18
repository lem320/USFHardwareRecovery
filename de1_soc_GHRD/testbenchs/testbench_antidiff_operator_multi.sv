module testbench_antidiff_operator_multi ();

//	parameter N = 3;

//	localparam signed  [15:0] arr [4:0] = '{
//		0:16'd1,
//		1:16'd4,
//		2:16'd7,
//		3:-16'd5,
//		4:-16'd3
//	};
//	
//	localparam signed  [15:0] arr2 [4:0] = '{
//		0:16'd0,
//		1:16'd2,
//		2:16'd4,
//		3:16'd6,
//		4:16'd5
//	};

	localparam signed  [15:0] arr [18:0] = '{
		0:16'd0,
		1:16'd0,
		2:-16'd8,
		3:16'd8,
		4:-16'd8,
		5:16'd8,
		6:-16'd8,
		7:16'd0,
		8:16'd16,
		9:-16'd24,
		10:16'd16,
		11:16'd0,
		12:-16'd16,
		13:16'd0,
		14:16'd0,
		15:16'd0,
		16:16'd0,
		17:16'd0,
		18:16'd0
	};
	
	
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
	integer i;

	reg clk = 1'b0;
	reg en = 1'b0;
	
	reg signed [15:0] in [18:0] = arr;
	wire signed [15:0] out [18:0];
	
	
	antidiff_operator_multi U0 (
		.clk(clk),
		.en(en),
		.reset(1'b0),
		.in(in),
		
		.out(out)
	);
	defparam U0.columns = 1;
		
	
	always
		#10 clk <= ~clk; // 50MHz
	
	initial begin
		#30
		en <= 1'b1;
		#10 en <= 1'b0;
		#1770 en <= 1'b1;
		#10 en <= 1'b0;
	end
	
//	initial begin
//		#90
//		in <= arr2;
//	end
	
//	initial
//		for (i = 0; i<=10; i = i + 1) begin
//			in <= arr[i];
//			#200;
//		end
		

endmodule