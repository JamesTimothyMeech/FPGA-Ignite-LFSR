iverilog -o wb_LFSR wb_lfsr.v LFSR.v wb_lfsr_test.v
vvp wb_LFSR -v	
gtkwave wave_wb.vcd
