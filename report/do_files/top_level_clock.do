vsim design-project.top_level

add wave -position insertpoint sim:/top_level/clock_50Mhz
add wave -position insertpoint sim:/top_level/system_reset_button
add wave -position insertpoint sim:/top_level/nes_data

add wave -position insertpoint sim:/top_level/not_nes_A
add wave -position insertpoint sim:/top_level/not_nes_B
add wave -position insertpoint sim:/top_level/not_nes_START
add wave -position insertpoint sim:/top_level/not_nes_SELECT

add wave -position insertpoint sim:/top_level/nes_latch
add wave -position insertpoint sim:/top_level/nes_clock

add wave -position insertpoint sim:/top_level/segs*


force -freeze clock_50Mhz	    0 0,    1 1	    -r {2}
force -freeze system_reset_button   0 0,    1 1

force -freeze nes_data	x
run 1

force -freeze nes_data  x 0, x 4, x 8,  x 12, x 16, x 20, x 24, x 28, x 32	-r {34}
force -freeze nes_data  1 2, 1 6, 1 10, 1 14, 1 18, 1 22, 1 26, 1 30		-r {34}
run 34

force -freeze nes_data  0 2, 1 6, 1 10, 1 14, 1 18, 1 22, 1 26, 1 30		-r {34}
run 34

force -freeze nes_data  1 2, 1 6, 0 10, 0 14, 1 18, 1 22, 1 26, 1 30		-r {34}
run 200000000

force -freeze nes_data  1 2, 1 6, 1 10, 0 14, 1 18, 1 22, 1 26, 1 30		-r {34}
run 100000000

force -freeze nes_data  1 2, 1 6, 0 10, 1 14, 1 18, 1 22, 1 26, 1 30		-r {34}
run 50000000

force -freeze nes_data  1 2, 1 6, 1 10, 1 14, 1 18, 1 22, 1 26, 1 30		-r {34}
run 10000000

force -freeze nes_data  1 2, 0 6, 1 10, 1 14, 1 18, 1 22, 1 26, 1 30		-r {34}
run 34

force -freeze nes_data  0 2, 1 6, 1 10, 1 14, 1 18, 1 22, 1 26, 1 30		-r {34}
run 34

force -freeze nes_data  1 2, 1 6, 1 10, 1 14, 1 18, 1 22, 1 26, 1 30		-r {34}
run 20000000000
