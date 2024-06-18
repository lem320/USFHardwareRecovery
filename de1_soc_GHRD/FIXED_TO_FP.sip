set_global_assignment -entity "FIXED_TO_FP" -library "lib_FIXED_TO_FP" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "FIXED_TO_FP" -library "lib_FIXED_TO_FP" -name IP_TOOL_VERSION "21.1"
set_global_assignment -entity "FIXED_TO_FP" -library "lib_FIXED_TO_FP" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_FIXED_TO_FP" -name SPD_FILE [file join $::quartus(sip_path) "FIXED_TO_FP.spd"]

set_global_assignment -library "lib_FIXED_TO_FP" -name MISC_FILE [file join $::quartus(sip_path) "FIXED_TO_FP_sim/FIXED_TO_FP.vo"]
