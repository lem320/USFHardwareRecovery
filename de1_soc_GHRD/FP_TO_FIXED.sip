set_global_assignment -entity "FP_TO_FIXED" -library "lib_FP_TO_FIXED" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "FP_TO_FIXED" -library "lib_FP_TO_FIXED" -name IP_TOOL_VERSION "21.1"
set_global_assignment -entity "FP_TO_FIXED" -library "lib_FP_TO_FIXED" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_FP_TO_FIXED" -name SPD_FILE [file join $::quartus(sip_path) "FP_TO_FIXED.spd"]

set_global_assignment -library "lib_FP_TO_FIXED" -name MISC_FILE [file join $::quartus(sip_path) "FP_TO_FIXED_sim/FP_TO_FIXED.vo"]
