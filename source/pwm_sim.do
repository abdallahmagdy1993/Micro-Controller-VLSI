vsim -gui work.pwm
# vsim -gui work.pwm 
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading work.pwm(struct)
# Loading work.my_ndff(b_my_ndff)
# Loading work.my_dff(a_my_dff)
# Loading work.tri_state_buffer(arch)
add wave  \
sim:/pwm/data_bus \
sim:/pwm/clk \
sim:/pwm/rd_wr \
sim:/pwm/en \
sim:/pwm/a0 \
sim:/pwm/rst \
sim:/pwm/add_en \
sim:/pwm/pwm_out \
sim:/pwm/res \
sim:/pwm/duty \
sim:/pwm/res_reg_en \
sim:/pwm/res_tri_en \
sim:/pwm/duty_reg_en \
sim:/pwm/duty_tri_en \
sim:/pwm/counter \
sim:/pwm/used_clk
force -freeze sim:/pwm/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/pwm/rst 1 0
force -freeze sim:/pwm/en 1 0
run
force -freeze sim:/pwm/rst 0 0
force -freeze sim:/pwm/data_bus 00000010 0
force -freeze sim:/pwm/rd_wr 1 0
force -freeze sim:/pwm/en 1 0
force -freeze sim:/pwm/a0 0 0
force -freeze sim:/pwm/add_en 1 0
run
force -freeze sim:/pwm/data_bus 00000001 0
force -freeze sim:/pwm/a0 1 0
run
force -freeze sim:/pwm/add_en 0 0
run
run
run
run
run
run
run
run
run
run
run
run
run
force -freeze sim:/pwm/data_bus 00001011 0
force -freeze sim:/pwm/add_en 1 0
force -freeze sim:/pwm/a0 0 0
run
force -freeze sim:/pwm/add_en 0 0
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
