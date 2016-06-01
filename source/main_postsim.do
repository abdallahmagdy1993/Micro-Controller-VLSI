vsim -gui -sdfnowarn -sdftyp /=C:/altera/14.0/postVLSI/post_min.sdf -sdfnoerror work.main_1

add wave  \
sim:/main_1/data_bus \
sim:/main_1/pins \
sim:/main_1/add_bus \
sim:/main_1/clk \
sim:/main_1/rd_wr \
sim:/main_1/en \
sim:/main_1/rst \
sim:/main_1/ext_clk \
sim:/main_1/Global_INT \
sim:/main_1/int_reg_en \
sim:/main_1/int_tri_en \
sim:/main_1/int0 \
sim:/main_1/int1 \
sim:/main_1/pwm_out \
sim:/main_1/int_en_reg \
sim:/main_1/timer0_comp/add_en \
sim:/main_1/timer0_comp/c_word \
sim:/main_1/timer0_comp/counter \
sim:/main_1/timer0_comp/data \
sim:/main_1/timer1_comp/add_en \
sim:/main_1/timer1_comp/c_word \
sim:/main_1/timer1_comp/counter \
sim:/main_1/timer1_comp/data \
sim:/main_1/pwm_comp/add_en \
sim:/main_1/pwm_comp/res \
sim:/main_1/pwm_comp/duty \
sim:/main_1/GPIO_comp/add_en \
sim:/main_1/GPIO_comp/c_word \
sim:/main_1/GPIO_comp/c_word2 \
sim:/main_1/GPIO_comp/data

force -freeze sim:/main_1/rst 1 0
force -freeze sim:/main_1/en 1 0
force -freeze sim:/main_1/clk 1 0, 0 {5000 ps} -r 10 ns
force -freeze sim:/main_1/ext_clk 1 0, 0 {10000 ps} -r 20 ns
force -freeze sim:/main_1/add_bus 8'b11111111 0
run
force -freeze sim:/main_1/rst 0 0
run
force -freeze sim:/main_1/add_bus 8'b01000101 0
force -freeze sim:/main_1/data_bus 8'b00000110 0
force -freeze sim:/main_1/rd_wr 1 0
run
noforce sim:/main_1/data_bus
force -freeze sim:/main_1/add_bus 8'b01000001 0
force -freeze sim:/main_1/rd_wr 0 0
run
force -freeze sim:/main_1/add_bus 8'b11111111 0
run
run
run
force -freeze sim:/main_1/data_bus 8'b00000111 0
force -freeze sim:/main_1/add_bus 8'b01100101 0
force -freeze sim:/main_1/rd_wr 1 0
run
force -freeze sim:/main_1/add_bus 8'b11111111 0
run
run
run
force -freeze sim:/main_1/data_bus 8'b00000111 0
force -freeze sim:/main_1/add_bus 8'b01001000 0
force -freeze sim:/main_1/rd_wr 1 0
run
force -freeze sim:/main_1/add_bus 8'b01001001 0
force -freeze sim:/main_1/data_bus 8'b00000101 0
run
force -freeze sim:/main_1/add_bus 8'b11111111 0
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
force -freeze sim:/main_1/add_bus 8'b00110000 0
force -freeze sim:/main_1/data_bus 8'b00000010 0
run
force -freeze sim:/main_1/add_bus 8'b11111111 0
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



