vsim design-project.L293D_encoder

add wave -position insertpoint sim:/L293D_encoder/motor_1_on
add wave -position insertpoint sim:/L293D_encoder/motor_2_on

add wave -position insertpoint sim:/L293D_encoder/motor_1_dir
add wave -position insertpoint sim:/L293D_encoder/motor_2_dir

add wave -position insertpoint sim:/L293D_encoder/enable_1
add wave -position insertpoint sim:/L293D_encoder/input_1
add wave -position insertpoint sim:/L293D_encoder/input_2

add wave -position insertpoint sim:/L293D_encoder/enable_2
add wave -position insertpoint sim:/L293D_encoder/input_3
add wave -position insertpoint sim:/L293D_encoder/input_4

force -freeze motor_1_on    0 0, 1 100, 0 {300}
force -freeze motor_2_on    0 0, 1 100, 0 {300}
force -freeze motor_1_dir   0 0, 1 {200}
force -freeze motor_2_dir   0 0, 1 {200}

run 400
