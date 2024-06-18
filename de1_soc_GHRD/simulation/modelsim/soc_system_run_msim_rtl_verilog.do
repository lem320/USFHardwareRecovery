transcript on
if ![file isdirectory soc_system_iputf_libs] {
	file mkdir soc_system_iputf_libs
}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

###### Libraries for IPUTF cores 
###### End libraries for IPUTF cores 
###### MIF file copy and HDL compilation commands for IPUTF cores 

file copy -force C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/FP_LOG_sim/FP_LOG_memoryC0_uid134_lnTables_lutmem.hex ./
file copy -force C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/FP_LOG_sim/FP_LOG_memoryC0_uid135_lnTables_lutmem.hex ./
file copy -force C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/FP_LOG_sim/FP_LOG_memoryC1_uid138_lnTables_lutmem.hex ./
file copy -force C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/FP_LOG_sim/FP_LOG_memoryC2_uid142_lnTables_lutmem.hex ./
file copy -force C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/FP_DIVIDE_sim/FP_DIVIDE_memoryC0_uid146_invTables_lutmem.hex ./
file copy -force C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/FP_DIVIDE_sim/FP_DIVIDE_memoryC0_uid147_invTables_lutmem.hex ./
file copy -force C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/FP_DIVIDE_sim/FP_DIVIDE_memoryC1_uid150_invTables_lutmem.hex ./
file copy -force C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/FP_DIVIDE_sim/FP_DIVIDE_memoryC1_uid151_invTables_lutmem.hex ./
file copy -force C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/FP_DIVIDE_sim/FP_DIVIDE_memoryC2_uid154_invTables_lutmem.hex ./

vlog "C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/FP_SUB_sim/FP_SUB.vo"          
vlog "C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/FP_MULT_sim/FP_MULT.vo"        
vlog "C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/FP_LOG_sim/FP_LOG.vo"          
vlog "C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/FIXED_TO_FP_sim/FIXED_TO_FP.vo"
vlog "C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/FP_TO_FIXED_sim/FP_TO_FIXED.vo"
vlog "C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/FP_GEQ_sim/FP_GEQ.vo"          
vlog "C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/FP_GREATER_sim/FP_GREATER.vo"  
vlog "C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/FP_ADD_sim/FP_ADD.vo"          
vlog "C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/FP_DIVIDE_sim/FP_DIVIDE.vo"    

vlog -vlog01compat -work work +incdir+C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD {C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/FP_SUB.vo}
vlog -vlog01compat -work work +incdir+C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD {C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/FP_MULT.vo}
vlog -vlog01compat -work work +incdir+C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD {C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/FP_LOG.vo}
vlog -vlog01compat -work work +incdir+C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD {C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/FIXED_TO_FP.vo}
vlog -vlog01compat -work work +incdir+C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD {C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/FP_TO_FIXED.vo}
vlog -vlog01compat -work work +incdir+C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD {C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/FP_GEQ.vo}
vlog -vlog01compat -work work +incdir+C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD {C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/FP_GREATER.vo}
vlog -vlog01compat -work work +incdir+C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD {C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/FP_ADD.vo}
vlog -vlog01compat -work work +incdir+C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD {C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/ghrd_top.v}
vlog -vlog01compat -work work +incdir+C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/ip/altsource_probe {C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/ip/altsource_probe/hps_reset.v}
vlog -vlog01compat -work work +incdir+C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/ip/debounce {C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/ip/debounce/debounce.v}
vlog -vlog01compat -work work +incdir+C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/ip/edge_detect {C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/ip/edge_detect/altera_edge_detector.v}
vlog -vlog01compat -work work +incdir+C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD {C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/INPUT_FIFO.v}
vlog -vlog01compat -work work +incdir+C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD {C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/ltc2308.v}
vlog -sv -work work +incdir+C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD {C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/rom_test1.sv}
vlog -sv -work work +incdir+C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD {C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/parameters.sv}
vlog -sv -work work +incdir+C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD {C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/functions.sv}
vlog -sv -work work +incdir+C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD {C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/usf_top.sv}
vlog -sv -work work +incdir+C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD {C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/usf_recovery_multi.sv}
vlog -sv -work work +incdir+C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD {C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/kn_function.sv}
vlog -sv -work work +incdir+C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD {C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/diff_operator_multi.sv}
vlog -sv -work work +incdir+C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD {C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/antidiff_operator_multi.sv}
vlog -sv -work work +incdir+C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD {C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/fold_remover3.sv}
vlog -sv -work work +incdir+C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD {C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/loop_block_multi.sv}
vlib FP_MULT
vmap FP_MULT FP_MULT
vcom -93 -work FP_MULT {C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/FP_MULT/dspba_library_package.vhd}
vlib FIXED_TO_FP
vmap FIXED_TO_FP FIXED_TO_FP
vcom -93 -work FIXED_TO_FP {C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/FIXED_TO_FP/dspba_library_package.vhd}
vlib FP_TO_FIXED
vmap FP_TO_FIXED FP_TO_FIXED
vcom -93 -work FP_TO_FIXED {C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/FP_TO_FIXED/dspba_library_package.vhd}
vlib FP_GREATER
vmap FP_GREATER FP_GREATER
vcom -93 -work FP_GREATER {C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/FP_GREATER/dspba_library_package.vhd}
vlib FP_ADD
vmap FP_ADD FP_ADD
vcom -93 -work FP_ADD {C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/FP_ADD/dspba_library_package.vhd}
vcom -93 -work FP_MULT {C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/FP_MULT/dspba_library.vhd}
vcom -93 -work FP_MULT {C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/FP_MULT/FP_MULT_0002.vhd}
vcom -93 -work FIXED_TO_FP {C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/FIXED_TO_FP/dspba_library.vhd}
vcom -93 -work FIXED_TO_FP {C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/FIXED_TO_FP/FIXED_TO_FP_0002.vhd}
vcom -93 -work FP_TO_FIXED {C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/FP_TO_FIXED/dspba_library.vhd}
vcom -93 -work FP_TO_FIXED {C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/FP_TO_FIXED/FP_TO_FIXED_0002.vhd}
vcom -93 -work FP_GREATER {C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/FP_GREATER/FP_GREATER_0002.vhd}
vcom -93 -work FP_ADD {C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/FP_ADD/dspba_library.vhd}
vcom -93 -work FP_ADD {C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/FP_ADD/FP_ADD_0002.vhd}
vlib FP_LOG
vmap FP_LOG FP_LOG
vlib FP_DIVIDE
vmap FP_DIVIDE FP_DIVIDE

vlog -vlog01compat -work work +incdir+C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD {C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/testbench.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -L FP_MULT -L FIXED_TO_FP -L FP_TO_FIXED -L FP_GREATER -L FP_ADD -L FP_LOG -L FP_DIVIDE -voptargs="+acc"  testbench

add wave *
view structure
view signals
run -all
