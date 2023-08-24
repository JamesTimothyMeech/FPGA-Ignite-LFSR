iverilog -o LFSR LFSR.v LFSR_test.v
vvp LFSR -v	
gtkwave wave.vcd
