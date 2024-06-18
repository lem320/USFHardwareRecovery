`ifndef SET_PARAMATERS

`include "parameters.sv"

function [OUT_RES-1:0] CMOD_L (input[OUT_RES-1:0] x);
	return {{(OUT_RES-1-B){x[B]}}, x[B:0]};
endfunction

function [OUT_RES-1:0] ROUND_2L (input[OUT_RES-1:0] x);
	return {x[OUT_RES-1:B+1] + x[B],(B+1)'('b0)};
endfunction

function signed [OUT_RES-1:0] LIMIT_L (input signed[OUT_RES-1:0] x);
	return (x > L ? L : (x < -L ? -L : x));
endfunction

function [OUT_RES-1:0] ABS (input[OUT_RES-1:0] x);
	return (x[OUT_RES-1] ? ~x + 1'b1 : x);
endfunction




function [9:0] GET_DIFF_OPERATOR_CYCLE ();
	return FOLD_REMOVER_DELAY;
endfunction

function [9:0] GET_LOOP_BLOCK_CYCLE ();
	return DIFF_OPERATOR_DELAY + GET_DIFF_OPERATOR_CYCLE();
endfunction

function [9:0] GET_ANTIDIFF_OPERATOR_CYCLE (input k_found);
	return (!k_found ? LOOP_BLOCK_DELAY1 : LOOP_BLOCK_DELAY2) + GET_LOOP_BLOCK_CYCLE();
endfunction

function [9:0] GET_USF_RECOVERY_DELAY (input k_found);
	return GET_ANTIDIFF_OPERATOR_CYCLE(k_found) + FIRST_ORDER_ANTIDIFF_DELAY;
endfunction


`endif