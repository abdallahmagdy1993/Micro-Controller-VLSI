remove_design -all


read_file -format vhdl  ../source/my_DFF.vhd
analyze -library WORK -format vhdl {../source/my_DFF.vhd}
elaborate my_DFF -architecture a_my_DFF -library WORK
link
check_design
source ../source/constrains.sdc		
compile -exact_map
report_area > ../results/DFF/area
report_timing > ../results/DFF/timing
rc > ../results/DFF/violations




report_clock -skew
report_qor
write -hierarchy -format verilog -output ../results/DFF/DFF.v
set_case_analysis 0 [get_ports rst]

report_constraint -all_violators -significant_digits 4 > ../results/DFF/post_min_constr.rpt
report_timing -delay min -nworst 40 -significant_digits 4 > ../results/DFF/post_min_timing.rpt
write_sdf ../results/DFF/post_min.sdf

report_timing -delay max -nworst 40 -significant_digits 4 > ../results/DFF/post_max_timing.rpt
write_sdf ../results/DFF/post_max.sdf
