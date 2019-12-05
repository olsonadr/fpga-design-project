vsim design-project.counter
add wave -position insertpoint sim:/counter/*
force -freeze sim:/counter/clk 0 0, 1 {25 ps} -r 50
force -freeze sim:/counter/reset 1 0 -cancel 50
force -freeze sim:/counter/enable 1 0 -cancel 100
run 100
force -freeze sim:/counter/enable 0 0 -cancel 50
run 50
force -freeze sim:/counter/enable 1 0
run 150
