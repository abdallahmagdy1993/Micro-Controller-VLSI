vsim -gui -sdfnowarn -sdftyp /=C:/altera/14.0/postVLSI/post_min.sdf -sdfnoerror work.GPIO

add wave  \
sim:/GPIO/data_bus \
sim:/GPIO/pins \
sim:/GPIO/clk \
sim:/GPIO/rd_wr \
sim:/GPIO/en \
sim:/GPIO/a1 \
sim:/GPIO/a0 \
sim:/GPIO/rst \
sim:/GPIO/add_en \
sim:/GPIO/int0 \
sim:/GPIO/int1 \
sim:/GPIO/pwm \
sim:/GPIO/c_word \
sim:/GPIO/c_word2 \
sim:/GPIO/data \
sim:/GPIO/cnt_reg_en \
sim:/GPIO/cnt_tri_en \
sim:/GPIO/cnt2_reg_en \
sim:/GPIO/cnt2_tri_en \
sim:/GPIO/data_tri_en 
force -freeze sim:/GPIO/clk 1 0, 0 {5000 ps} -r 10 ns
force -freeze sim:/GPIO/rst 1 0
run
force -freeze sim:/GPIO/rst 0 0
force -freeze sim:/GPIO/data_bus 8'b10101111 0
force -freeze sim:/GPIO/rd_wr 1 0
force -freeze sim:/GPIO/en 1 0
force -freeze sim:/GPIO/a1 1 0
force -freeze sim:/GPIO/a0 0 0
force -freeze sim:/GPIO/add_en 1 0
force -freeze sim:/GPIO/int0 1 0
force -freeze sim:/GPIO/int0 1 0, 0 {10000 ps} -r 20 ns
force -freeze sim:/GPIO/int1 1 0, 0 {12500 ps} -r 25 ns
force -freeze sim:/GPIO/pwm 1 0, 0 {15000 ps} -r 30 ns
run
force -freeze sim:/GPIO/add_en 0 0
run
force -freeze sim:/GPIO/data_bus 8'b10101111 0
force -freeze sim:/GPIO/add_en 1 0
force -freeze sim:/GPIO/a1 0 0
run
force -freeze sim:/GPIO/add_en 0 0
force -freeze sim:/GPIO/pins 8'b11110000 0
run
force -freeze sim:/GPIO/data_bus 8'b00000000 0
force -freeze sim:/GPIO/add_en 1 0
run
force -freeze sim:/GPIO/add_en 0 0
run
force -freeze sim:/GPIO/add_en 1 0
force -freeze sim:/GPIO/a0 1 0
force -freeze sim:/GPIO/data_bus 8'b00000111 0
noforce sim:/GPIO/pins
run
force -freeze sim:/GPIO/add_en 0 0
run
run
run

