module testbench_fold_remover ();

//	localparam signed  [15:0] arr [18:0] = '{
//		0:16'd1969,
//		1:16'd1931,
//		2:16'd2007,
//		3:16'd2007,
//		4:16'd2007,
//		5:16'd2007,
//		6:16'd2045,
//		7:16'd2045,
//		8:16'd2007,
//		9:16'd2045,
//		10:16'd1022,
//		11:-16'd1439,
//		12:-16'd1893,
//		13:-16'd1817,
//		14:-16'd1742,
//		15:-16'd1780,
//		16:-16'd1742,
//		17:-16'd1780,
//		18:-16'd1742
//	};
	
//	localparam signed  [15:0] arr [18:0] = '{
//		0:-16'd1969,
//		1:-16'd1931,
//		2:-16'd2007,
//		3:-16'd2007,
//		4:-16'd2007,
//		5:-16'd2007,
//		6:-16'd2045,
//		7:-16'd2045,
//		8:-16'd2007,
//		9:-16'd2045,
//		10:-16'd1022,
//		11:16'd1439,
//		12:16'd1893,
//		13:16'd1817,
//		14:16'd1742,
//		15:16'd1780,
//		16:16'd1742,
//		17:16'd1780,
//		18:16'd1742
//	};

	localparam signed  [15:0] arr [18:0] = '{
		0:16'd2000,
		1:16'd2040,
		2:16'd1000,
		3:-16'd1250,
		4:-16'd1900,
		5:-16'd1800,
		6:-16'd1700,
		7:-16'd1500,
		8:-16'd1000,
		9:-16'd500,
		10:16'd0,
		11:16'd500,
		12:16'd1000,
		13:16'd1500,
		14:16'd1700,
		15:16'd1800,
		16:16'd2000,
		17:16'd1300,
		18:16'd400
	};
	
	localparam signed  [15:0] arr2 [18:0] = '{
		0:-16'd500,
		1:-16'd1200,
		2:-16'd1900,
		3:-16'd2000,
		4:-16'd1500,
		5:-16'd1500,
		6:-16'd1500,
		7:-16'd1400,
		8:-16'd1400,
		9:-16'd1500,
		10:-16'd1500,
		11:-16'd1500,
		12:-16'd1500,
		13:-16'd1600,
		14:-16'd1700,
		15:-16'd1800,
		16:-16'd1900,
		17:-16'd2000,
		18:-16'd1000
	};
	
	
	integer i;

	reg clk = 1'b0;
	reg en = 1'b0;
	
	reg signed [15:0] in [18:0] = arr;
	wire signed [15:0] out [18:0];
	
	
	fold_remover U0 (
		.clk(clk),
		.en(en),
		.reset(1'b0),
		.in(in),
		
		.out(out)
	);
		
	
	always
		#10 clk <= ~clk; // 50MHz
	
	initial begin
		#30
		en <= 1'b1;
		#10 en <= 1'b0;
//		#70 en <= 1'b1;
//		#10 en <= 1'b0;
	end
	
	initial begin
		#500
		in <= arr2;
		#10
		en <= 1'b1;
		#10
		en <= 1'b0;
	end
	
//	initial
//		for (i = 0; i<=10; i = i + 1) begin
//			in <= arr[i];
//			#200;
//		end
		

endmodule