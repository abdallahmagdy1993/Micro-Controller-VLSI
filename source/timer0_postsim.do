
#vsim -gui -sdfnowarn -sdftyp /=C:/altera/14.0/postVLSI/post_min.sdf -sdfnoerror work.timer0_1
vsim -gui work.timer0_1
add wave  \
sim:/timer0_1/data_bus \
sim:/timer0_1/clk \
sim:/timer0_1/rd_wr \
sim:/timer0_1/ext_clk \
sim:/timer0_1/en \
sim:/timer0_1/a0 \
sim:/timer0_1/rst \
sim:/timer0_1/add_en \
sim:/timer0_1/int0 \
sim:/timer0_1/c_word \
sim:/timer0_1/counter \
sim:/timer0_1/data \
sim:/timer0_1/cnt_tri_en \
sim:/timer0_1/data_tri_en \
sim:/timer0_1/final_clk

force -freeze sim:/timer0_1/clk 1 0, 0 {5000 ps} -r 10 ns
force -freeze sim:/timer0_1/rd_wr 1 0
force -freeze sim:/timer0_1/ext_clk 1 0, 0 {10000 ps} -r 20 ns
force -freeze sim:/timer0_1/en 1 0
force -freeze sim:/timer0_1/rst 1 0
run
force -freeze sim:/timer0_1/a0 1 0
force -freeze sim:/timer0_1/add_en 1 0
force -freeze sim:/timer0_1/rst 0 0
force -freeze sim:/timer0_1/data_bus 8'b11111110 0
run
force -freeze sim:/timer0_1/add_en 0 0
run
run
run
run
run
run
force -freeze sim:/timer0_1/add_en 1 0
force -freeze sim:/timer0_1/data_bus 8'b00000110 0
run
force -freeze sim:/timer0_1/add_en 0 0
run
run
run
run
force -freeze sim:/timer0_1/add_en 1 0
force -freeze sim:/timer0_1/data_bus 8'b00000110 0
run
force -freeze sim:/timer0_1/add_en 0 0
run
run
run
run
run
run
force -freeze sim:/timer0_1/a0 0 0
force -freeze sim:/timer0_1/add_en 1 0
force -freeze sim:/timer0_1/data_bus 8'b00000010 0
run
force -freeze sim:/timer0_1/a0 1 0
force -freeze sim:/timer0_1/data_bus 8'b11111100 0
run
force -freeze sim:/timer0_1/add_en 0 0
run