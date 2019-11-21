onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -height 30 -expand -group {Enable Inputs} /L293D_encoder/motor_1_on
add wave -noupdate -height 30 -expand -group {Enable Inputs} /L293D_encoder/motor_2_on
add wave -noupdate -height 30 -expand -group {Direction Inputs} /L293D_encoder/motor_1_dir
add wave -noupdate -height 30 -expand -group {Direction Inputs} /L293D_encoder/motor_2_dir
add wave -noupdate -height 30 -expand -group {First Motor Outputs} /L293D_encoder/enable_1
add wave -noupdate -height 30 -expand -group {First Motor Outputs} /L293D_encoder/input_1
add wave -noupdate -height 30 -expand -group {First Motor Outputs} /L293D_encoder/input_2
add wave -noupdate -height 30 -expand -group {Second Motor Outputs} /L293D_encoder/enable_2
add wave -noupdate -height 30 -expand -group {Second Motor Outputs} /L293D_encoder/input_3
add wave -noupdate -height 30 -expand -group {Second Motor Outputs} /L293D_encoder/input_4
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 260
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {923 ps}
bookmark add wave bookmark0 {{0 ps} {894 ps}} 0
