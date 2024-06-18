set_global_assignment -entity "FP_ADD" -library "lib_FP_ADD" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "FP_ADD" -library "lib_FP_ADD" -name IP_TOOL_VERSION "21.1"
set_global_assignment -entity "FP_ADD" -library "lib_FP_ADD" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_FP_ADD" -name SPD_FILE [file join $::quartus(sip_path) "FP_ADD.spd"]

set_global_assignment -library "lib_FP_ADD" -name MISC_FILE [file join $::quartus(sip_path) "FP_ADD_sim/FP_ADD.vo"]
