module diff_order_calculator (
	input clk_50,
	input en,
	input wire[11:0] L_mV,
	output reg [15:0] N
);


	reg[4:0] counter = 5'b0;
//	wire[31:0] FP_L_mV, FP_L, FP_LOG_L, A, B;
	
	parameter[31:0] FP_INV_1000    = 32'b00111010100000110001001001101111;
	parameter[31:0] FP_LOG_BG      = 32'b10111101000101110010010001110100;
	parameter[31:0] FP_INV_LOG_TOE = 32'b10111111101010010110000111100101;
	
	
	reg[15:0] CONV1_A;
	wire[31:0] CONV1_Q;
	FIXED_TO_FP CONV1 (
		.clk(clk_50),
		.areset(1'b0),
		.en(en),
		.a(CONV1_A),
		.q(CONV1_Q)
	);
	
	reg[31:0] CONV2_A;
	wire[15:0] CONV2_Q;
	FP_TO_FIXED CONV2 (
		.clk(clk_50),
		.areset(1'b0),
		.en(en),
		.a(CONV2_A),
		.q(CONV2_Q)
	);
	
	
	reg[31:0] MULT_A, MULT_B;
	wire[31:0] MULT_Q;
	FP_MULT MULT (
		.clk(clk_50),
		.areset(1'b0),
		.en(en),
		.a(MULT_A),
		.b(MULT_B),
		.q(MULT_Q)
	);
	
	reg[31:0] SUB_A, SUB_B;
	wire[31:0] SUB_Q;
	FP_SUB SUB (
		.clk(clk_50),
		.areset(1'b0),
		.en(en),
		.a(SUB_A),
		.b(SUB_B),
		.q(SUB_Q)
	);
	
	reg[31:0] LOG_A;
	wire[31:0] LOG_Q;
	FP_LOG LOG (
		.clk(clk_50),
		.areset(1'b0),
		.en(en),
		.a(LOG_A),
		.q(LOG_Q)
	);
	
	reg[31:0] GEQ_A, GEQ_B;
	wire GEQ_Q;
	FP_GEQ GEQ (
		.clk(clk_50),
		.areset(1'b0),
		.en(en),
		.a(GEQ_A),
		.b(GEQ_B),
		.q(GEQ_Q)
	);
	
	
	always @ (negedge clk_50) begin
	
		case (counter)
			5'd0:
				CONV1_A <= {4'd0,L_mV};
				
			5'd1: begin
				MULT_A <= CONV1_Q;
				MULT_B <= FP_INV_1000;
			end
			
			5'd3:
				LOG_A <= MULT_Q;
			
			5'd13: begin
				SUB_A <= LOG_Q;
				SUB_B <= FP_LOG_BG;
			end
			
			5'd15: begin
				MULT_A <= SUB_Q;
				MULT_B <= FP_INV_LOG_TOE;
			end
			
			5'd17:
				CONV2_A <= MULT_Q;
			
			5'd18:
				CONV1_A <= CONV2_Q;
				
			5'd19: begin
				GEQ_A <= CONV1_Q;
				GEQ_B <= MULT_Q;
			end
			
			5'd20: begin
				if (GEQ_Q)
					N <= CONV2_Q;
				else
					N <= CONV2_Q + 1'b1;
			end
						
		endcase
	
		if (counter == 5'd20)
			counter <= 5'b0;
		else
			counter <= counter + 1'b1;
		
	end
	
endmodule