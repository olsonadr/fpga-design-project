vsim design-project.nes_to_motor
add wave -position insertpoint sim:/nes_to_motor/forward
add wave -position insertpoint sim:/nes_to_motor/backward
add wave -position insertpoint sim:/nes_to_motor/left
add wave -position insertpoint sim:/nes_to_motor/right
add wave -position insertpoint sim:/nes_to_motor/motor_1_on
add wave -position insertpoint sim:/nes_to_motor/motor_1_dir
add wave -position insertpoint sim:/nes_to_motor/motor_2_on
add wave -position insertpoint sim:/nes_to_motor/motor_2_dir

force -freeze	forward	    1 0, 0 30,	       1 {200}
force -freeze	backward    0 0, 1 50,  0 80,  1 {200}
force -freeze	left	    0 0, 1 100, 0 130, 1 {200}
force -freeze	right	    0 0, 1 150, 0 180, 1 {200}

run 250
