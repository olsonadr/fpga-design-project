onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -height 30 -expand -group {System Inputs} -label {Motor 1 Enable} /motor_simple_test/motor_1_on
add wave -noupdate -height 30 -expand -group {System Inputs} -label {Motor 1 Direction} /motor_simple_test/motor_1_dir
add wave -noupdate -height 30 -expand -group {System Inputs} -label {Motor 2 Enable} /motor_simple_test/motor_2_on
add wave -noupdate -height 30 -expand -group {System Inputs} -label {Motor 2 Direction} /motor_simple_test/motor_2_dir
add wave -noupdate -height 30 -expand -group {Chip Outputs} -label {L293D Output 1} /motor_simple_test/output_1
add wave -noupdate -height 30 -expand -group {Chip Outputs} -label {L293D Output 2} /motor_simple_test/output_2
add wave -noupdate -height 30 -expand -group {Chip Outputs} -label {L293D Output 3} /motor_simple_test/output_3
add wave -noupdate -height 30 -expand -group {Chip Outputs} -label {L293D Output 4} /motor_simple_test/output_4
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 357
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
WaveRestoreZoom {0 ps} {900 ps}
bookmark add wave bookmark0 {{0 ps} {894 ps}} 0
