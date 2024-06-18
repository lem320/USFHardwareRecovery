vlog -reportprogress 300 -work work C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/*.sv
vlog -reportprogress 300 -work work C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/*.v
vlog -reportprogress 300 -work work C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/testbenchs/*.sv
vcom -reportprogress 300 -work work C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/FIXED_TO_FP/dspba_library_package.vhd
vcom -reportprogress 300 -work work C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/FIXED_TO_FP/dspba_library.vhd
vcom -reportprogress 300 -work work C:/Users/luke/OneDrive/FYP/QUARTUS/de1_soc_GHRD/F*/*.vhd

#vsim -voptargs=+acc work.testbench_recovery