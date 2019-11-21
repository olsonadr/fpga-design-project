onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group {Simulated Buttons} /nes_test/A
add wave -noupdate -expand -group {Simulated Buttons} /nes_test/B
add wave -noupdate -expand -group {Simulated Buttons} /nes_test/START
add wave -noupdate -expand -group {Simulated Buttons} /nes_test/SELECT
add wave -noupdate -expand -group {Simulated Buttons} /nes_test/UP
add wave -noupdate -expand -group {Simulated Buttons} /nes_test/DOWN
add wave -noupdate -expand -group {Simulated Buttons} /nes_test/LEFT
add wave -noupdate -expand -group {Simulated Buttons} /nes_test/RIGHT
add wave -noupdate -height 30 -expand -group {Other Inputs} /nes_test/CLOCK
add wave -noupdate -height 30 -expand -group {Other Inputs} /nes_test/READ_CLOCK
add wave -noupdate -height 30 -expand -group {Other Inputs} /nes_test/RESET
add wave -noupdate -height 30 -expand -group {Decoder Outputs (System Values)} /nes_test/A_out
add wave -noupdate -height 30 -expand -group {Decoder Outputs (System Values)} /nes_test/B_out
add wave -noupdate -height 30 -expand -group {Decoder Outputs (System Values)} /nes_test/START_out
add wave -noupdate -height 30 -expand -group {Decoder Outputs (System Values)} /nes_test/SELECT_out
add wave -noupdate -height 30 -expand -group {Decoder Outputs (System Values)} /nes_test/UP_out
add wave -noupdate -height 30 -expand -group {Decoder Outputs (System Values)} /nes_test/DOWN_out
add wave -noupdate -height 30 -expand -group {Decoder Outputs (System Values)} /nes_test/LEFT_out
add wave -noupdate -height 30 -expand -group {Decoder Outputs (System Values)} /nes_test/RIGHT_out
add wave -noupdate -height 30 -expand -group IDK /nes_test/SYNTHESIZED_WIRE_0
add wave -noupdate -height 30 -expand -group IDK /nes_test/SYNTHESIZED_WIRE_1
add wave -noupdate -height 30 -expand -group IDK /nes_test/SYNTHESIZED_WIRE_2
add wave -noupdate -height 30 -expand -group IDK /nes_test/SYNTHESIZED_WIRE_3
add wave -noupdate -height 30 -expand -group IDK /nes_test/SYNTHESIZED_WIRE_4
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {103 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 355
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
WaveRestoreZoom {0 ps} {856 ps}
bookmark add wave bookmark0 {{0 ps} {894 ps}} 0
