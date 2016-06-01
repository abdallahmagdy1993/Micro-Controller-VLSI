vsim -gui work.gpio
# vsim -gui work.gpio 
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading work.gpio(struct)
# Loading work.my_ndff(b_my_ndff)
# Loading work.my_dff(a_my_dff)
# Loading work.tri_state_buffer(arch)
add wave  \
sim:/gpio/data_bus \
sim:/gpio/pins \
sim:/gpio/clk \
sim:/gpio/rd_wr \
sim:/gpio/en \
sim:/gpio/a1 \
sim:/gpio/a0 \
sim:/gpio/rst \
sim:/gpio/add_en \
sim:/gpio/int0 \
sim:/gpio/int1 \
sim:/gpio/pwm \
sim:/gpio/c_word \
sim:/gpio/c_word2 \
sim:/gpio/data \
sim:/gpio/cnt_reg_en \
sim:/gpio/cnt_tri_en \
sim:/gpio/cnt2_reg_en \
sim:/gpio/cnt2_tri_en \
sim:/gpio/data_reg_en \
sim:/gpio/data_tri_en 
force -freeze sim:/gpio/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/gpio/rst 1 0
run
force -freeze sim:/gpio/rst 0 0
force -freeze sim:/gpio/data_bus 10101111 0
force -freeze sim:/gpio/rd_wr 1 0
force -freeze sim:/gpio/en 1 0
force -freeze sim:/gpio/a1 1 0
force -freeze sim:/gpio/a0 0 0
force -freeze sim:/gpio/add_en 1 0
force -freeze sim:/gpio/int0 1 0
force -freeze sim:/gpio/int0 1 0, 0 {100 ps} -r 200
force -freeze sim:/gpio/int1 1 0, 0 {125 ps} -r 250
force -freeze sim:/gpio/pwm 1 0, 0 {150 ps} -r 300
run
force -freeze sim:/gpio/add_en 0 0
run
force -freeze sim:/gpio/data_bus 10101111 0
force -freeze sim:/gpio/add_en 1 0
force -freeze sim:/gpio/a1 0 0
run
force -freeze sim:/gpio/add_en 0 0
force -freeze sim:/gpio/pins 11110000 0
run
force -freeze sim:/gpio/data_bus 00000000 0
force -freeze sim:/gpio/add_en 1 0
run
force -freeze sim:/gpio/a0 1 0
force -freeze sim:/gpio/data_bus 00000111 0
noforce sim:/gpio/pins
run
force -freeze sim:/gpio/add_en 0 0
run
run
run

