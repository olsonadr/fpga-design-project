vsim design-project.delay 
add wave -position insertpoint sim:/delay/clock_in
add wave -position insertpoint sim:/delay/enable
add wave -position insertpoint sim:/delay/reset
add wave -position insertpoint sim:/delay/double_speed
add wave -position insertpoint sim:/delay/super_speed
add wave -position insertpoint sim:/delay/select
add wave -position insertpoint sim:/delay/clock_option
add wave -position insertpoint sim:/delay/clock_out

force -freeze sim:/delay/clock_in 0 0, 1 {50 ps} -r 100
force -freeze sim:/delay/enable 1 0
force -freeze sim:/delay/reset 1 0 -cancel 200
force -freeze sim:/delay/double_speed 0 0
force -freeze sim:/delay/super_speed 0 0

run 100000
