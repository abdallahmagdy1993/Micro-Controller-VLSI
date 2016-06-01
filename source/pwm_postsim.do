vsim -gui -sdfnowarn -sdftyp /=C:/altera/14.0/postVLSI/post_min.sdf -sdfnoerror work.pwm_1
add wave  \
sim:/pwm_1/data_bus \
sim:/pwm_1/clk \
sim:/pwm_1/rd_wr \
sim:/pwm_1/en \
sim:/pwm_1/a0 \
sim:/pwm_1/rst \
sim:/pwm_1/add_en \
sim:/pwm_1/pwm_out \
sim:/pwm_1/res_reg_en \
sim:/pwm_1/res_tri_en \
sim:/pwm_1/duty_reg_en \
sim:/pwm_1/duty_tri_en \
sim:/pwm_1/used_clk \
sim:/pwm_1/res \
sim:/pwm_1/duty \
sim:/pwm_1/counter_in \
sim:/pwm_1/counter \
sim:/pwm_1/SYNOPSYS_UNCONNECTED__0

force -freeze sim:/pwm_1/clk 1 0, 0 {5000 ps} -r {10 ns}
force -freeze sim:/pwm_1/rst 1'h1 0
force -freeze sim:/pwm_1/en 1'h1 0
run
force -freeze sim:/pwm_1/rst 1'h0 0 0
force -freeze sim:/pwm_1/data_bus 8'b00000010 0
force -freeze sim:/pwm_1/rd_wr 1'h1 0
force -freeze sim:/pwm_1/en 1'h1 0
force -freeze sim:/pwm_1/a0 1'h0 0
force -freeze sim:/pwm_1/add_en 1'h1 0
run
force -freeze sim:/pwm_1/data_bus 8'b00000110 0
force -freeze sim:/pwm_1/a0 1'h1 0
run
force -freeze sim:/pwm_1/add_en 1'h0 0
run
run
run
run
run
run
run
run
run
run
run
run
run
force -freeze sim:/pwm_1/data_bus 8'b00001011 0
force -freeze sim:/pwm_1/add_en 1'h1 0
force -freeze sim:/pwm_1/a0 1'h0 0
run
force -freeze sim:/pwm_1/add_en 1'h0 0
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
