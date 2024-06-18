module testbench_diff_operator_multi ();

	parameter N = 3;

	localparam signed  [15:0] arr [4:0] = '{
		0:16'd1,
		1:16'd4,
		2:16'd7,
		3:-16'd5,
		4:-16'd3
	};
	
	localparam signed  [15:0] arr2 [4:0] = '{
		0:16'd0,
		1:16'd2,
		2:16'd4,
		3:16'd6,
		4:16'd5
	};
	
	integer i;

	reg clk = 1'b0;
	reg en = 1'b0;
	
	reg signed [15:0] in [4:0] = arr;
	wire signed [15:0] out [4:0];
	
	
	diff_operator_multi U0 (
		.clk(clk),
		.en(en),
		.reset(1'b0),
		.in(in),
		
		.out(out)
	);
		
	
	always
		#10 clk <= ~clk; // 50MHz
	
	always begin
		#190 en <= 1'b1;
		#10 en <= 1'b0;
	end
	
	initial begin
		#300
		in <= arr2;
	end
	
//	initial
//		for (i = 0; i<=10; i = i + 1) begin
//			in <= arr[i];
//			#200;
//		end
		

endmodule