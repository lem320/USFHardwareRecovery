set_global_assignment -entity "LOG_FP" -library "lib_LOG_FP" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "LOG_FP" -library "lib_LOG_FP" -name IP_TOOL_VERSION "21.1"
set_global_assignment -entity "LOG_FP" -library "lib_LOG_FP" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_LOG_FP" -name SPD_FILE [file join $::quartus(sip_path) "LOG_FP.spd"]

set_global_assignment -library "lib_LOG_FP" -name MISC_FILE [file join $::quartus(sip_path) "LOG_FP_sim/LOG_FP_memoryC0_uid134_lnTables_lutmem.hex"]
set_global_assignment -library "lib_LOG_FP" -name MISC_FILE [file join $::quartus(sip_path) "LOG_FP_sim/LOG_FP_memoryC0_uid135_lnTables_lutmem.hex"]
set_global_assignment -library "lib_LOG_FP" -name MISC_FILE [file join $::quartus(sip_path) "LOG_FP_sim/LOG_FP_memoryC1_uid138_lnTables_lutmem.hex"]
set_global_assignment -library "lib_LOG_FP" -name MISC_FILE [file join $::quartus(sip_path) "LOG_FP_sim/LOG_FP_memoryC2_uid142_lnTables_lutmem.hex"]
set_global_assignment -library "lib_LOG_FP" -name MISC_FILE [file join $::quartus(sip_path) "LOG_FP_sim/LOG_FP.vo"]
