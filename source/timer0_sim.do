vsim -gui work.timer0
# vsim -gui work.timer0 
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading work.timer0(struct)
# Loading work.my_ndff(b_my_ndff)
# Loading work.my_dff(a_my_dff)
# Loading work.tri_state_buffer(arch)

add wave  \
sim:/timer0/data_bus \
sim:/timer0/clk \
sim:/timer0/rd_wr \
sim:/timer0/ext_clk \
sim:/timer0/en \
sim:/timer0/a0 \
sim:/timer0/rst \
sim:/timer0/add_en \
sim:/timer0/int0 \
sim:/timer0/c_word \
sim:/timer0/counter \
sim:/timer0/data \
sim:/timer0/cnt_reg_en \
sim:/timer0/cnt_tri_en \
sim:/timer0/data_reg_en \
sim:/timer0/data_tri_en \
sim:/timer0/midd_clk \
sim:/timer0/midd_clk2 \
sim:/timer0/midd_clk3 \
sim:/timer0/midd_clk4 \
sim:/timer0/final_clk

force -freeze sim:/timer0/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/timer0/rd_wr 1 0
force -freeze sim:/timer0/ext_clk 1 0, 0 {125 ps} -r 250
force -freeze sim:/timer0/en 1 0
force -freeze sim:/timer0/rst 1 0
run
force -freeze sim:/timer0/a0 1 0
force -freeze sim:/timer0/add_en 1 0
force -freeze sim:/timer0/rst 0 0
force -freeze sim:/timer0/data_bus 8'b11111110 0
run
force -freeze sim:/timer0/add_en 0 0
run
run
run
run
run
run
force -freeze sim:/timer0/add_en 1 0
force -freeze sim:/timer0/data_bus 8'b00000010 0
run
force -freeze sim:/timer0/add_en 0 0
run
run
run
run
force -freeze sim:/timer0/add_en 1 0
force -freeze sim:/timer0/data_bus 8'b00000110 0
run
force -freeze sim:/timer0/add_en 0 0
run
run
run
run
run
run
force -freeze sim:/timer0/a0 0 0
force -freeze sim:/timer0/add_en 1 0
force -freeze sim:/timer0/data_bus 8'b00000010 0
run
force -freeze sim:/timer0/a0 1 0
force -freeze sim:/timer0/data_bus 8'b11111100 0
run
force -freeze sim:/timer0/add_en 0 0
run