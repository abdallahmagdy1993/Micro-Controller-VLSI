vsim -gui work.timer1
# vsim -gui work.timer1 
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading work.timer1(struct)
# Loading work.my_ndff(b_my_ndff)
# Loading work.my_dff(a_my_dff)
# Loading work.tri_state_buffer(arch)
# Loading work.prescaler(behavioral)
# Loading work.postscaler(behavioral)
add wave  \
sim:/timer1/data_bus \
sim:/timer1/clk \
sim:/timer1/pre_clk \
sim:/timer1/one_clk \
sim:/timer1/rd_wr \
sim:/timer1/en \
sim:/timer1/a0 \
sim:/timer1/rst \
sim:/timer1/add_en \
sim:/timer1/int1 \
sim:/timer1/overflow \
sim:/timer1/c_word \
sim:/timer1/counter \
sim:/timer1/data \
sim:/timer1/cnt_reg_en \
sim:/timer1/cnt_tri_en \
sim:/timer1/data_reg_en \
sim:/timer1/data_tri_en \
sim:/timer1/used_clk \
sim:/timer1/prescale \
sim:/timer1/postscale
force -freeze sim:/timer1/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/timer1/rst 1 0
force -freeze sim:/timer1/en 1 0
run
force -freeze sim:/timer1/data_bus 00000110 0
force -freeze sim:/timer1/rd_wr 1 0
force -freeze sim:/timer1/en 1 0
force -freeze sim:/timer1/a0 1 0
force -freeze sim:/timer1/add_en 1 0
force -freeze sim:/timer1/rst 0 0
run
force -freeze sim:/timer1/add_en 0 0
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
force -freeze sim:/timer1/a0 0 0
force -freeze sim:/timer1/data_bus 00000001 0
force -freeze sim:/timer1/add_en 1 0
run
run
force -freeze sim:/timer1/add_en 0 0
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
force -freeze sim:/timer1/data_bus 00001001 0
force -freeze sim:/timer1/add_en 1 0
run
force -freeze sim:/timer1/add_en 0 0
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
force -freeze sim:/timer1/data_bus 00010010 0
force -freeze sim:/timer1/add_en 1 0
run
run
force -freeze sim:/timer1/add_en 0 0
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
