###############################################################################
# Created by write_sdc
# Fri Aug 25 20:35:35 2023
###############################################################################
current_design wb_lfsr
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 10.0000 
set_clock_uncertainty 0.2500 clk
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {i_clk}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {i_reset}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {i_wb_addr[0]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {i_wb_addr[1]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {i_wb_addr[2]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {i_wb_cyc}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {i_wb_data[0]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {i_wb_data[1]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {i_wb_data[2]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {i_wb_data[3]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {i_wb_data[4]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {i_wb_data[5]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {i_wb_data[6]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {i_wb_data[7]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {i_wb_stb}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {i_wb_we}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {o_wb_ack}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {o_wb_data}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {o_wb_stall}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0334 [get_ports {o_wb_ack}]
set_load -pin_load 0.0334 [get_ports {o_wb_data}]
set_load -pin_load 0.0334 [get_ports {o_wb_stall}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {i_clk}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {i_reset}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {i_wb_cyc}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {i_wb_stb}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {i_wb_we}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {i_wb_addr[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {i_wb_addr[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {i_wb_addr[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {i_wb_data[7]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {i_wb_data[6]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {i_wb_data[5]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {i_wb_data[4]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {i_wb_data[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {i_wb_data[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {i_wb_data[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {i_wb_data[0]}]
set_timing_derate -early 0.9500
set_timing_derate -late 1.0500
###############################################################################
# Design Rules
###############################################################################
set_max_transition 0.7500 [current_design]
set_max_fanout 10.0000 [current_design]
