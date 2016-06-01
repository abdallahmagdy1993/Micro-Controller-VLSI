remove_design -all

read_file -format vhdl  ../source/my_DFF.vhd
analyze -library WORK -format vhdl {../source/my_DFF.vhd}

#//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
read_file -format vhdl  ../source/my_nDFF.vhd
analyze -library WORK -format vhdl {../source/my_nDFF.vhd}

#//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
read_file -format vhdl  ../source/postscaler.vhd
analyze -library WORK -format vhdl {../source/postscaler.vhd}

#//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
read_file -format vhdl  ../source/prescaler.vhd
analyze -library WORK -format vhdl {../source/prescaler.vhd}

#//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
read_file -format vhdl  ../source/tri_state_buffer.vhd
analyze -library WORK -format vhdl {../source/tri_state_buffer.vhd}


#//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
read_file -format vhdl  ../source/timer0.vhd
analyze -library WORK -format vhdl {../source/timer0.vhd}

#//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
read_file -format vhdl  ../source/timer1.vhd
analyze -library WORK -format vhdl {../source/timer1.vhd}

#//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
read_file -format vhdl  ../source/pwm.vhd
analyze -library WORK -format vhdl {../source/pwm.vhd}

#//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
read_file -format vhdl  ../source/GPIO.vhd
analyze -library WORK -format vhdl {../source/GPIO.vhd}

#//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
read_file -format vhdl  ../source/main.vhd
analyze -library WORK -format vhdl {../source/main.vhd}
elaborate main -architecture struct -library WORK
link
check_design
source ../source/constrains2.sdc		
compile -exact_map
report_area > ../results/main/area
report_timing > ../results/main/timing
rc > ../results/main/violations

report_clock -skew
report_qor
write -hierarchy -format verilog -output ../results/main/main.v
set_case_analysis 0 [get_ports rst]

report_constraint -all_violators -significant_digits 4 > ../results/main/post_min_constr.rpt
report_timing -delay min -nworst 40 -significant_digits 4 > ../results/main/post_min_timing.rpt
write_sdf ../results/main/post_min.sdf

report_timing -delay max -nworst 40 -significant_digits 4 > ../results/main/post_max_timing.rpt
write_sdf ../results/main/post_max.sdf
