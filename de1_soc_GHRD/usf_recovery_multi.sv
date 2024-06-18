module usf_recovery_multi (
	clk, en, reset,
	in, out,
	k_found
);

	`include "functions.sv"

	parameter rows = J+1;
	
	input clk, en, reset;
	
	input [ADC_RES-1:0] in [rows-1+EXTRA_SAMPLES:0];
	output wire signed [OUT_RES-1:0] out [rows-1:0];
	output wire k_found;


	genvar i;

	// Extend the input to the correct resolution
	wire signed [OUT_RES-1:0] y_raw [rows-1+EXTRA_SAMPLES:0];
	generate
		for (i=0; i<rows+EXTRA_SAMPLES; i=i+1) begin : set_y_raw
			assign y_raw[i] = LIMIT_L({{(OUT_RES-ADC_RES)'('b0)},in[i]} - L);
		end
	endgenerate
	
	// This was required as an extra step, otherwise ADC readings were corrupted
	// Unsure why
	wire signed [OUT_RES-1:0] y_tmp [rows-1+EXTRA_SAMPLES:0];
	generate
		for (i=0; i<rows+EXTRA_SAMPLES; i=i+1) begin : set_y
			assign y_tmp[i] = y_raw[i];// & 16'hFFFE;
		end
	endgenerate
	
	// Use a fold remover
	wire signed [OUT_RES-1:0] y [rows-1:0];
	fold_remover3 FOLD_REMOVER (
		.clk(clk),
		.reset(reset),
		.en(en),
		.in(y_tmp),
		.out(y)
	);
	
//	fold_remover2 FOLD_REMOVER (
//		.clk(clk),
//		.reset(reset),
//		.en(en),
//		.in(y_tmp[rows-1:0]),
//		.out(y)
//	);

				
	// Get the Nth derivative of y
	wire signed [OUT_RES-1:0] DN_y [rows-1:0];
	reg diff_en = 1'b0;
	diff_operator_multi DIFF (
		.clk(clk),
		.reset(reset),
		.en(diff_en),
		
		.in(y),
		.out(DN_y)
	);
	
	// Obtain DN_res
	wire signed [OUT_RES-1:0] DN_res [rows-1:0];
	generate
		for (i=0; i<rows; i=i+1) begin : set_DN_res
			assign DN_res[i] = ROUND_2L(CMOD_L(DN_y[i]) - DN_y[i]);
		end
	endgenerate
	
	// Get s_final by running loop block
	wire signed [OUT_RES-1:0] s_final [rows-1:0];
	reg lb_en = 1'b0;
	loop_block_multi LOOP_BLOCK (
		.clk(clk),
		.reset(reset),
		.en(lb_en),
		.in(DN_res),
		.out(s_final),
		.k_found(k_found)
	);
	
	wire signed [OUT_RES-1:0] Ss_final [rows-1:0];
	reg ad_en = 1'b0;
	antidiff_operator_multi ANTIDIFF (
		.clk(clk),
		.reset(reset),
		.en(ad_en),
		.in(s_final),
		.out(Ss_final)
	);
	
	generate
		for (i=0; i<rows; i=i+1) begin : set_out
			assign out[i] = y[i] + Ss_final[i];
		end
	endgenerate
	
	reg[15:0] counter = GET_ANTIDIFF_OPERATOR_CYCLE(1'b0)+1;
	reg k_found_local = 1'b0;
	
	always @ (negedge clk) begin	
		diff_en <= counter==GET_DIFF_OPERATOR_CYCLE();
		lb_en <= counter==GET_LOOP_BLOCK_CYCLE();
		ad_en <= counter==GET_ANTIDIFF_OPERATOR_CYCLE(k_found_local);
	
		if (counter<GET_ANTIDIFF_OPERATOR_CYCLE(k_found_local)+FIRST_ORDER_ANTIDIFF_DELAY+1)
			counter <= counter + 1'b1;
		else if (en) begin
			counter <= 2'd2;
			k_found_local <= k_found;
		end
	end

endmodule