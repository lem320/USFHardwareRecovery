set_global_assignment -entity "FP_LOG" -library "lib_FP_LOG" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "FP_LOG" -library "lib_FP_LOG" -name IP_TOOL_VERSION "21.1"
set_global_assignment -entity "FP_LOG" -library "lib_FP_LOG" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_FP_LOG" -name SPD_FILE [file join $::quartus(sip_path) "FP_LOG.spd"]

set_global_assignment -library "lib_FP_LOG" -name MISC_FILE [file join $::quartus(sip_path) "FP_LOG_sim/FP_LOG_memoryC0_uid134_lnTables_lutmem.hex"]
set_global_assignment -library "lib_FP_LOG" -name MISC_FILE [file join $::quartus(sip_path) "FP_LOG_sim/FP_LOG_memoryC0_uid135_lnTables_lutmem.hex"]
set_global_assignment -library "lib_FP_LOG" -name MISC_FILE [file join $::quartus(sip_path) "FP_LOG_sim/FP_LOG_memoryC1_uid138_lnTables_lutmem.hex"]
set_global_assignment -library "lib_FP_LOG" -name MISC_FILE [file join $::quartus(sip_path) "FP_LOG_sim/FP_LOG_memoryC2_uid142_lnTables_lutmem.hex"]
set_global_assignment -library "lib_FP_LOG" -name MISC_FILE [file join $::quartus(sip_path) "FP_LOG_sim/FP_LOG.vo"]
