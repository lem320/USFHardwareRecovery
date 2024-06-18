module testbench_diff_operator ();

	parameter N = 3;

	localparam signed  [15:0] arr [4:0] = '{
		0:16'd1,
		1:16'd4,
		2:16'd7,
		3:-16'd5,
		4:-16'd3
	};
	integer i;

	reg clk = 1'b0;
	reg en = 1'b0;
	
	reg signed [15:0] in = 16'd1;
	wire signed [15:0] out [N:1];
	
	
	diff_operator_multi U0 (
		.clk(clk),
		.en(en),
		.reset(1'b0),
		.y(in),
		
		.out(out)
	);
	defparam U0.max_order = N;
		
	
	always
		#10 clk <= ~clk; // 50MHz
	
	always begin
		#190 en <= 1'b1;
		#10 en <= 1'b0;
	end
	
	initial
		for (i = 0; i<=10; i = i + 1) begin
			in <= arr[i];
			#200;
		end
		

endmodule