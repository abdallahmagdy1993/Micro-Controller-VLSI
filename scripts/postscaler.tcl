remove_design -all

read_file -format vhdl  ../source/my_DFF.vhd
analyze -library WORK -format vhdl {../source/my_DFF.vhd}

#//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
read_file -format vhdl  ../source/my_nDFF.vhd
analyze -library WORK -format vhdl {../source/my_nDFF.vhd}


#//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
read_file -format vhdl  ../source/postscaler.vhd
analyze -library WORK -format vhdl {../source/postscaler.vhd}
elaborate postscaler -architecture Behavioral -library WORK
link
check_design
source ../source/constrains.sdc		
compile -exact_map
report_area > ../results/postscaler/area
report_timing > ../results/postscaler/timing
rc > ../results/postscaler/violations


report_clock -skew
report_qor
write -hierarchy -format verilog -output ../results/postscaler/postscaler.v
set_case_analysis 0 [get_ports rst]

report_constraint -all_violators -significant_digits 4 > ../results/postscaler/post_min_constr.rpt
report_timing -delay min -nworst 40 -significant_digits 4 > ../results/postscaler/post_min_timing.rpt
write_sdf ../results/postscaler/post_min.sdf

report_timing -delay max -nworst 40 -significant_digits 4 > ../results/postscaler/post_max_timing.rpt
write_sdf ../results/postscaler/post_max.sdf
