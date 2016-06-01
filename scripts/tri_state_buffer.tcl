remove_design -all

#//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
read_file -format vhdl  ../source/tri_state_buffer.vhd
analyze -library WORK -format vhdl {../source/tri_state_buffer.vhd}
elaborate tri_state_buffer -architecture Arch -library WORK
link
check_design
source ../source/tri_stateconstrains.sdc		
compile -exact_map
report_area > ../results/tri_state_buffer/area
report_timing > ../results/tri_state_buffer/timing
rc > ../results/tri_state_buffer/violations

report_clock -skew
report_qor
write -hierarchy -format verilog -output ../results/tri_state_buffer/tri_state_buffer.v
set_case_analysis 0 [get_ports rst]

report_constraint -all_violators -significant_digits 4 > ../results/tri_state_buffer/post_min_constr.rpt
report_timing -delay min -nworst 40 -significant_digits 4 > ../results/tri_state_buffer/post_min_timing.rpt
write_sdf ../results/tri_state_buffer/post_min.sdf

report_timing -delay max -nworst 40 -significant_digits 4 > ../results/tri_state_buffer/post_max_timing.rpt
write_sdf ../results/tri_state_buffer/post_max.sdf
