set_global_assignment -entity "FP_GREATER" -library "lib_FP_GREATER" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "FP_GREATER" -library "lib_FP_GREATER" -name IP_TOOL_VERSION "21.1"
set_global_assignment -entity "FP_GREATER" -library "lib_FP_GREATER" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_FP_GREATER" -name SPD_FILE [file join $::quartus(sip_path) "FP_GREATER.spd"]

set_global_assignment -library "lib_FP_GREATER" -name MISC_FILE [file join $::quartus(sip_path) "FP_GREATER_sim/FP_GREATER.vo"]
