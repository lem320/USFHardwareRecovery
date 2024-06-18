set_global_assignment -entity "FP_SUB" -library "lib_FP_SUB" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "FP_SUB" -library "lib_FP_SUB" -name IP_TOOL_VERSION "21.1"
set_global_assignment -entity "FP_SUB" -library "lib_FP_SUB" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_FP_SUB" -name SPD_FILE [file join $::quartus(sip_path) "FP_SUB.spd"]

set_global_assignment -library "lib_FP_SUB" -name MISC_FILE [file join $::quartus(sip_path) "FP_SUB_sim/FP_SUB.vo"]
