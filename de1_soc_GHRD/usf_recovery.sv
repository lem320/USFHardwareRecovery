`include "functions.sv"

module usf_recovery (
	input clk,
	input en,
	input reset,
	input[ADC_RES-1:0] in,
	output wire[OUT_RES-1:0] out
);

	// Extend the input to the correct resolution
	wire signed [OUT_RES-1:0] y = {{(OUT_RES-ADC_RES){in[ADC_RES-1]}},in};
	
	// Get the derivatives of y
	wire signed [OUT_RES-1:0] Dn_y [N:1];
//	reg diff_en = 1'b0;
	wire diff_en;
	assign diff_en = en;
	diff_operator DIFF (
		.clk(clk),
		.reset(1'd0),
		.en(diff_en),
		
		.y(y),
		.out(Dn_y)
	);
	defparam DIFF.max_order = N;
	
	// Obtain the DN_res
	wire signed[OUT_RES-1:0] DN_res = ROUND_2L(CMOD_L(Dn_y[N]) - Dn_y[N]);
	
	// Get s_final by running loop block
	wire signed [OUT_RES-1:0] s_final;
	reg lb_en = 1'b0;
	loop_block LOOP_BLOCK (
		.clk(clk),
		.reset(1'd0),
		.en(lb_en),
		.res(DN_res),
		.out(s_final)
	);
	
	
	reg[N_bits+2:0] counter = N+3;
	always @ (posedge clk) begin
		case (counter)
//			7'd0:
//				diff_en <= 1'b1;
//			1'd1:
//				diff_en <= 1'b0;
			
			(N):
				lb_en <= 1'b1;
			(N+1):
				lb_en <= 1'b0;
		endcase
		
		if (counter < N+3)
			counter <= counter + 1'b1;
		else if (en) begin
			counter <= 1'b1;
//			diff_en <= 1'b1;
		end
	
	end

endmodule