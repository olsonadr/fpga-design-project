vsim design-project.top_level

add wave -position insertpoint sim:/top_level/clock_50Mhz
add wave -position insertpoint sim:/top_level/system_reset_button
add wave -position insertpoint sim:/top_level/nes_data

add wave -position insertpoint sim:/top_level/not_nes_UP
add wave -position insertpoint sim:/top_level/not_nes_DOWN
add wave -position insertpoint sim:/top_level/not_nes_LEFT
add wave -position insertpoint sim:/top_level/not_nes_RIGHT

add wave -position insertpoint sim:/top_level/nes_latch
add wave -position insertpoint sim:/top_level/nes_clock

add wave -position insertpoint sim:/top_level/L293D_enable_1
add wave -position insertpoint sim:/top_level/L293D_input_1
add wave -position insertpoint sim:/top_level/L293D_input_2
add wave -position insertpoint sim:/top_level/L293D_enable_2
add wave -position insertpoint sim:/top_level/L293D_input_3
add wave -position insertpoint sim:/top_level/L293D_input_4


force -freeze clock_50Mhz	    0 0,    1 1	    -r {2}
force -freeze system_reset_button   0 0,    1 1

force -freeze nes_data	x
run 1

force -freeze nes_data  x 0, x 4, x 8,  x 12, x 16, x 20, x 24, x 28, x 32	-r {34}
force -freeze nes_data  1 2, 1 6, 1 10, 1 14, 1 18, 1 22, 1 26, 1 30		-r {34}
run 34

force -freeze nes_data  1 2, 1 6, 1 10, 1 14, 0 18, 1 22, 1 26, 1 30		-r {34}
run 34

force -freeze nes_data  1 2, 1 6, 1 10, 1 14, 1 18, 0 22, 1 26, 1 30		-r {34}
run 34

force -freeze nes_data  1 2, 1 6, 1 10, 1 14, 1 18, 1 22, 0 26, 1 30		-r {34}
run 34

force -freeze nes_data  1 2, 1 6, 1 10, 1 14, 1 18, 1 22, 1 26, 0 30		-r {34}
run 34

force -freeze nes_data  1 2, 1 6, 1 10, 1 14, 1 18, 1 22, 1 26, 1 30		-r {34}
run 68
