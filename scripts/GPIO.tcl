remove_design -all

read_file -format vhdl  ../source/my_DFF.vhd
analyze -library WORK -format vhdl {../source/my_DFF.vhd}

#//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
read_file -format vhdl  ../source/my_nDFF.vhd
analyze -library WORK -format vhdl {../source/my_nDFF.vhd}

#//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
read_file -format vhdl  ../source/tri_state_buffer.vhd
analyze -library WORK -format vhdl {../source/tri_state_buffer.vhd}

#//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
read_file -format vhdl  ../source/GPIO.vhd
analyze -library WORK -format vhdl {../source/GPIO.vhd}
elaborate GPIO -architecture struct -library WORK
link
check_design
source ../source/constrains.sdc		
compile -exact_map
report_area > ../results/GPIO/area
report_timing > ../results/GPIO/timing
rc > ../results/GPIO/violations


report_clock -skew
report_qor
write -hierarchy -format verilog -output ../results/GPIO/GPIO.v
set_case_analysis 0 [get_ports rst]

report_constraint -all_violators -significant_digits 4 > ../results/GPIO/post_min_constr.rpt
report_timing -delay min -nworst 40 -significant_digits 4 > ../results/GPIO/post_min_timing.rpt
write_sdf ../results/GPIO/post_min.sdf

report_timing -delay max -nworst 40 -significant_digits 4 > ../results/GPIO/post_max_timing.rpt
write_sdf ../results/GPIO/post_max.sdf
