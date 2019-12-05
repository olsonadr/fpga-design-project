vsim design-project.nes_decoder

add wave -position insertpoint sim:/nes_decoder/in_clock
add wave -position insertpoint sim:/nes_decoder/read_data
add wave -position insertpoint sim:/nes_decoder/reset
add wave -position insertpoint sim:/nes_decoder/nes_*
add wave -position insertpoint sim:/nes_decoder/ready_to_read
add wave -position insertpoint sim:/nes_decoder/count
add wave -position insertpoint sim:/nes_decoder/tmp_buttons
add wave -position insertpoint sim:/nes_decoder/prev_input
add wave -position insertpoint sim:/nes_decoder/pause
add wave -position insertpoint sim:/nes_decoder/next
add wave -position insertpoint sim:/nes_decoder/apply
add wave -position insertpoint sim:/nes_decoder/tmp_ready

force -freeze	in_clock    1 0,    0 {25}    -r 50
force -freeze	nes_data    0 0,    1 250     -r 500
force -freeze	read_data   0 0,    1 10,     0 {20}
force -freeze	reset	    1 0,    0 {10}

run 900
