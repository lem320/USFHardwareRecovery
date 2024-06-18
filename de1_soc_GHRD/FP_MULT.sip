set_global_assignment -entity "FP_MULT" -library "lib_FP_MULT" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "FP_MULT" -library "lib_FP_MULT" -name IP_TOOL_VERSION "21.1"
set_global_assignment -entity "FP_MULT" -library "lib_FP_MULT" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_FP_MULT" -name SPD_FILE [file join $::quartus(sip_path) "FP_MULT.spd"]

set_global_assignment -library "lib_FP_MULT" -name MISC_FILE [file join $::quartus(sip_path) "FP_MULT_sim/FP_MULT.vo"]
