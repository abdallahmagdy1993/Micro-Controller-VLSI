remove_design -all

read_file -format vhdl  ../source/my_DFF.vhd
analyze -library WORK -format vhdl {../source/my_DFF.vhd}

#//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
read_file -format vhdl  ../source/my_nDFF.vhd
analyze -library WORK -format vhdl {../source/my_nDFF.vhd}

#//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
read_file -format vhdl  ../source/prescaler.vhd
analyze -library WORK -format vhdl {../source/prescaler.vhd}
elaborate prescaler -architecture Behavioral -library WORK
link
check_design
source ../source/constrains.sdc		
compile -exact_map
report_area > ../results/prescaler/area
report_timing > ../results/prescaler/timing
rc > ../results/prescaler/violations

report_clock -skew
report_qor
write -hierarchy -format verilog -output ../results/prescaler/prescaler.v
set_case_analysis 0 [get_ports rst]

report_constraint -all_violators -significant_digits 4 > ../results/prescaler/post_min_constr.rpt
report_timing -delay min -nworst 40 -significant_digits 4 > ../results/prescaler/post_min_timing.rpt
write_sdf ../results/prescaler/post_min.sdf

report_timing -delay max -nworst 40 -significant_digits 4 > ../results/prescaler/post_max_timing.rpt
write_sdf ../results/prescaler/post_max.sdf
