onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -height 30 -expand -group {Chip Inputs} /L293D_test_chip/enable_1
add wave -noupdate -height 30 -expand -group {Chip Inputs} /L293D_test_chip/input_1
add wave -noupdate -height 30 -expand -group {Chip Inputs} /L293D_test_chip/input_2
add wave -noupdate -height 30 -expand -group {Chip Inputs} /L293D_test_chip/enable_2
add wave -noupdate -height 30 -expand -group {Chip Inputs} /L293D_test_chip/input_3
add wave -noupdate -height 30 -expand -group {Chip Inputs} /L293D_test_chip/input_4
add wave -noupdate -height 30 -expand -group {Chip Outputs} /L293D_test_chip/output_1
add wave -noupdate -height 30 -expand -group {Chip Outputs} /L293D_test_chip/output_2
add wave -noupdate -height 30 -expand -group {Chip Outputs} /L293D_test_chip/output_3
add wave -noupdate -height 30 -expand -group {Chip Outputs} /L293D_test_chip/output_4
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 271
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
