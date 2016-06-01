vsim -gui work.main
# vsim -gui work.main 
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading work.main(struct)
# Loading work.timer0(struct)
# Loading work.my_ndff(b_my_ndff)
# Loading work.my_dff(a_my_dff)
# Loading work.tri_state_buffer(arch)
# Loading work.timer1(struct)
# Loading work.prescaler(behavioral)
# Loading work.postscaler(behavioral)
# Loading work.gpio(struct)

add wave  \
sim:/main/data_bus \
sim:/main/pins \
sim:/main/add_bus \
sim:/main/clk \
sim:/main/rd_wr \
sim:/main/en \
sim:/main/rst \
sim:/main/ext_clk \
sim:/main/Global_INT \
sim:/main/timer0_add_en \
sim:/main/timer1_add_en \
sim:/main/pwm_add_en \
sim:/main/GPIO_add_en \
sim:/main/int_reg_en \
sim:/main/int_tri_en \
sim:/main/int0 \
sim:/main/int1 \
sim:/main/pwm_out \
sim:/main/tmp_int0 \
sim:/main/tmp_int1 \
sim:/main/int_en_reg
add wave  \
sim:/main/timer0_comp/c_word \
sim:/main/timer0_comp/counter \
sim:/main/timer0_comp/data
add wave  \
sim:/main/timer1_comp/c_word \
sim:/main/timer1_comp/counter \
sim:/main/timer1_comp/data
add wave  \
sim:/main/pwm_comp/res \
sim:/main/pwm_comp/res_counter \
sim:/main/pwm_comp/duty \
sim:/main/pwm_comp/duty_counter
add wave  \
sim:/main/GPIO_comp/c_word \
sim:/main/GPIO_comp/c_word2 \
sim:/main/GPIO_comp/data

force -freeze sim:/main/rst 1 0
force -freeze sim:/main/en 1 0
force -freeze sim:/main/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/main/ext_clk 1 0, 0 {112 ps} -r 225
run
force -freeze sim:/main/rst 0 0
run
force -freeze sim:/main/add_bus 01000101 0
force -freeze sim:/main/data_bus 00000110 0
force -freeze sim:/main/rd_wr 1 0
run
noforce sim:/main/data_bus
force -freeze sim:/main/add_bus 01000001 0
force -freeze sim:/main/rd_wr 0 0
run
noforce sim:/main/add_bus
run
run
run
force -freeze sim:/main/data_bus 00000111 0
force -freeze sim:/main/add_bus 01100101 0
force -freeze sim:/main/rd_wr 1 0
run
noforce sim:/main/add_bus
run
run
run
force -freeze sim:/main/data_bus 00000111 0
force -freeze sim:/main/add_bus 01001000 0
force -freeze sim:/main/rd_wr 1 0
run
force -freeze sim:/main/add_bus 01001001 0
force -freeze sim:/main/data_bus 00000101 0
run
noforce sim:/main/add_bus
run
run
run
run
run
run
run
run
run
run
force -freeze sim:/main/add_bus 00110000 0
force -freeze sim:/main/data_bus 00000010 0
run
noforce sim:/main/add_bus
run
run
run
run
run
run
run
run
run
run
run
run
run
run



