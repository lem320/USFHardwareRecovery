module testbench_function ();

	`include "../functions.sv"
	
	
	localparam signed  [15:0] arr [10:0] = '{
		0:16'd1,
		1:16'd4,
		2: -16'd7,
		3:16'd9,
		4: -16'd14,
		5: -16'd10,
		6:16'd4,
		7: -16'd8,
		8:16'd10,
		9:16'd20,
		10:16'd30
	};
	integer i;
		
		
		reg clk = 1'b1;
		reg en = 1'b0;
		
		reg[15:0] in = 16'd1;
		wire[15:0] out;	
		
		assign out = ROUND_2L(in);
		
		
		always
			#10 clk <= ~clk; // 50MHz
		
		initial begin
			#100;
			for (i = 0; i<=10; i = i + 1) begin
				in <= arr[i];
				#200;
			end
		end


endmodule