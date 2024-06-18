`ifndef SET_PARAMATERS

//`define SET_PARAMATERS

// USER INPUTTED PARAMETERS

parameter L = 2048;
parameter Bg = L*3;
parameter T = 1/500000;
parameter ADC_RES = 12;
parameter OUT_RES = 16;


parameter N = 3;


//parameter denomenator_float = 32'h3c2aaaab; //1.0/(12.0*Bg);
parameter denomenator_float = 32'h37638e30; // for Bg = 3*2048


// CALCULATED PARAMETERS

//parameter N = $ceil(($log10(L) - $log2(Bg))/$log10(T*3.14159*2.71828));
parameter N_bits = $clog2(N);

parameter B = $clog2(L);
parameter J = 6*(Bg/L);

parameter EXTRA_SAMPLES = 1;

parameter FOLD_REMOVER_DELAY  = J+1+EXTRA_SAMPLES; // for initial diff
parameter DIFF_OPERATOR_DELAY = N;

parameter FIRST_ORDER_ANTIDIFF_DELAY = J+1;
//parameter N_ORDER_ANTIDIFF_DELAY = N*(J+1);

parameter LOOP_BLOCK_DELAY1   = FIRST_ORDER_ANTIDIFF_DELAY*N + (2*FIRST_ORDER_ANTIDIFF_DELAY+7)*(N-1); // for k not found     // was 10*
parameter LOOP_BLOCK_DELAY2   = FIRST_ORDER_ANTIDIFF_DELAY*N;            // for k found



`endif