vsim -gui -sdfnowarn -sdftyp /=C:/altera/14.0/postVLSI/post_min.sdf -sdfnoerror work.timer1_1

add wave  \
sim:/timer1_1/data_bus \
sim:/timer1_1/clk \
sim:/timer1_1/rd_wr \
sim:/timer1_1/en \
sim:/timer1_1/a0 \
sim:/timer1_1/rst \
sim:/timer1_1/add_en \
sim:/timer1_1/int1 \
sim:/timer1_1/cnt_reg_en \
sim:/timer1_1/cnt_tri_en \
sim:/timer1_1/data_reg_en \
sim:/timer1_1/data_tri_en \
sim:/timer1_1/used_clk \
sim:/timer1_1/one_clk \
sim:/timer1_1/pre_clk \
sim:/timer1_1/used_rst \
sim:/timer1_1/c_word \
sim:/timer1_1/data \
sim:/timer1_1/counter \
sim:/timer1_1/prescale \
sim:/timer1_1/counter_in

force -freeze sim:/timer1_1/clk 1 0, 0 {5000 ps} -r {10 ns}
force -freeze sim:/timer1_1/rst 1'h1 0
force -freeze sim:/timer1_1/en 1'h1 0
run
force -freeze sim:/timer1_1/data_bus 8'b00000110 0
force -freeze sim:/timer1_1/rd_wr 1 0
force -freeze sim:/timer1_1/en 1 0
force -freeze sim:/timer1_1/a0 1 0
force -freeze sim:/timer1_1/add_en 1 0
force -freeze sim:/timer1_1/rst 0 0
run
force -freeze sim:/timer1_1/add_en 0 0
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
force -freeze sim:/timer1_1/a0 0 0
force -freeze sim:/timer1_1/data_bus 8'b00000001 0
force -freeze sim:/timer1_1/add_en 1 0
run
run
force -freeze sim:/timer1_1/add_en 0 0
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
force -freeze sim:/timer1_1/data_bus 8'b00001001 0
force -freeze sim:/timer1_1/add_en 1 0
run
force -freeze sim:/timer1_1/add_en 0 0
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
force -freeze sim:/timer1_1/data_bus 8'b00010010 0
force -freeze sim:/timer1_1/add_en 1 0
run
run
force -freeze sim:/timer1_1/add_en 0 0
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
run
