set_global_assignment -entity "FP_GEQ" -library "lib_FP_GEQ" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "FP_GEQ" -library "lib_FP_GEQ" -name IP_TOOL_VERSION "21.1"
set_global_assignment -entity "FP_GEQ" -library "lib_FP_GEQ" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_FP_GEQ" -name SPD_FILE [file join $::quartus(sip_path) "FP_GEQ.spd"]

set_global_assignment -library "lib_FP_GEQ" -name MISC_FILE [file join $::quartus(sip_path) "FP_GEQ_sim/FP_GEQ.vo"]
