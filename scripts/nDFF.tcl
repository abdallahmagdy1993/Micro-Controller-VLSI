remove_design -all


read_file -format vhdl  ../source/my_DFF.vhd
analyze -library WORK -format vhdl {../source/my_DFF.vhd}

#//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
read_file -format vhdl  ../source/my_nDFF.vhd
analyze -library WORK -format vhdl {../source/my_nDFF.vhd}
elaborate my_nDFF -architecture a_my_nDFF -library WORK
link
check_design
source ../source/constrains.sdc		
compile -exact_map
report_area > ../results/nDFF/area
report_timing > ../results/nDFF/timing
rc > ../results/nDFF/violations

report_clock -skew
report_qor
write -hierarchy -format verilog -output ../results/nDFF/nDFF.v
set_case_analysis 0 [get_ports rst]

report_constraint -all_violators -significant_digits 4 > ../results/nDFF/post_min_constr.rpt
report_timing -delay min -nworst 40 -significant_digits 4 > ../results/nDFF/post_min_timing.rpt
write_sdf ../results/nDFF/post_min.sdf

report_timing -delay max -nworst 40 -significant_digits 4 > ../results/nDFF/post_max_timing.rpt
write_sdf ../results/nDFF/post_max.sdf
