module kn_function (
	clk, en, reset,
	Dn_res, Kn
);

	`include "functions.sv"

	parameter rows = J+1;

	
	input clk, en, reset;
	input signed [OUT_RES-1:0] Dn_res [rows-1:0];
	
	output wire signed [OUT_RES-1:0] Kn;
	

	wire signed [OUT_RES-1:0] S2_Dn_res [rows-1:0];
	reg antidiff_reset = 0;
	antidiff_operator_multi ANTIDIFF (
		.clk(clk),
		.reset(antidiff_reset || reset),
		.en(en),
		.in(Dn_res),
		.out(S2_Dn_res)
	);
	defparam ANTIDIFF.columns = 2;

	wire signed [OUT_RES-1:0] numerator = S2_Dn_res[0] - S2_Dn_res[rows-1];
	
	// Set up FP_FUNCTIONS
	reg signed[15:0] CONV1_A;
	wire[31:0] CONV1_Q;
	FIXED_TO_FP CONV1 (
		.clk(clk),
		.areset(1'b0),
		.en(1'b1),
		.a(CONV1_A),
		.q(CONV1_Q)
	);
	
	reg[31:0] CONV2_A;
	wire signed[15:0] CONV2_Q;
	FP_TO_FIXED CONV2 (
		.clk(clk),
		.areset(1'b0),
		.en(1'b1),
		.a(CONV2_A),
		.q(CONV2_Q)
	);
	
	reg[31:0] MULT_A, MULT_B;
	wire[31:0] MULT_Q;
	FP_MULT MULT (
		.clk(clk),
		.areset(1'b0),
		.en(1'b1),
		.a(MULT_A),
		.b(MULT_B),
		.q(MULT_Q)
	);
	
	reg[31:0] ADD_A, ADD_B;
	wire[31:0] ADD_Q;
	FP_ADD ADD (
		.clk(clk),
		.areset(1'b0),
		.a(ADD_A),
		.b(ADD_B),
		.q(ADD_Q)
	);
	
	reg[31:0] GREATER_A, GREATER_B;
	wire GREATER_Q;
	FP_GREATER GREATER (
		.clk(clk),
		.areset(1'b0),
		.a(GREATER_A),
		.b(GREATER_B),
		.q(GREATER_Q)
	);
	
	assign Kn = CONV2_Q - GREATER_Q;
	
	reg[5:0] counter = 0;
	always @ (negedge clk) begin
	
		if (en)
			counter <= 1;
		else if (counter < 2**FIRST_ORDER_ANTIDIFF_DELAY+7)
			counter <= counter + 1;
	
		case (counter)
			2*FIRST_ORDER_ANTIDIFF_DELAY:
				CONV1_A <= numerator;
			
			2*FIRST_ORDER_ANTIDIFF_DELAY+1: begin
				MULT_A <= CONV1_Q;
				MULT_B <= denomenator_float;
				antidiff_reset <= 1'b1;
			end
			
			2*FIRST_ORDER_ANTIDIFF_DELAY+2:
				antidiff_reset <= 1'b0;
			
			2*FIRST_ORDER_ANTIDIFF_DELAY+3: begin
				ADD_A <= MULT_Q;
				ADD_B <= 32'h3f000000; // 0.5
			end
			
			2*FIRST_ORDER_ANTIDIFF_DELAY+5:
				CONV2_A <= ADD_Q;
				
			2*FIRST_ORDER_ANTIDIFF_DELAY+6:
				CONV1_A <= CONV2_Q;
			
			2*FIRST_ORDER_ANTIDIFF_DELAY+7: begin
				GREATER_A <= CONV1_Q;
				GREATER_B <= ADD_Q;
			end
				
					
		endcase	
		
	end

endmodule