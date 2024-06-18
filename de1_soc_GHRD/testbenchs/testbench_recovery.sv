module testbench_recovery ();

localparam  [15:0] arr [10:0] = '{
		0:16'd1,
		1:16'd4,
		2:16'd7,
		3:-16'd5,
		4:-16'd3,
		5:16'd1,
		6:16'd4,
		7:16'd8,
		8:16'd10,
		9:16'd20,
		10:16'd30
	};
	integer i;

	reg clk = 1'b1;
	reg en = 1'b0;
	
	reg[15:0] in = 16'd1;
	wire[15:0] out;	
	
	usf_recovery U0 (
		.clk(clk),
		.en(en),
		.reset(1'b0),
		
		.in(in),
		.out(out)
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
			#180 en <= 1'b1;
		end
	end



endmodule