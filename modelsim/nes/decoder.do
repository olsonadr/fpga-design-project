onerror {resume}
quietly set dataset_list [list sim vsim]
if {[catch {datasetcheck $dataset_list}]} {abort}
quietly WaveActivateNextPane {} 0
add wave -noupdate -height 30 -expand -group Inputs sim:/nes_decoder/nes_data
add wave -noupdate -height 30 -expand -group Inputs sim:/nes_decoder/in_clock
add wave -noupdate -height 30 -expand -group Inputs sim:/nes_decoder/read_data
add wave -noupdate -height 30 -expand -group Inputs sim:/nes_decoder/reset
add wave -noupdate -height 30 -expand -group Outputs sim:/nes_decoder/nes_latch
add wave -noupdate -height 30 -expand -group Outputs sim:/nes_decoder/nes_clock
add wave -noupdate -height 30 -expand -group Outputs sim:/nes_decoder/nes_A
add wave -noupdate -height 30 -expand -group Outputs sim:/nes_decoder/nes_B
add wave -noupdate -height 30 -expand -group Outputs sim:/nes_decoder/nes_START
add wave -noupdate -height 30 -expand -group Outputs sim:/nes_decoder/nes_SELECT
add wave -noupdate -height 30 -expand -group Outputs sim:/nes_decoder/nes_UP
add wave -noupdate -height 30 -expand -group Outputs sim:/nes_decoder/nes_DOWN
add wave -noupdate -height 30 -expand -group Outputs sim:/nes_decoder/nes_LEFT
add wave -noupdate -height 30 -expand -group Outputs sim:/nes_decoder/nes_RIGHT
add wave -noupdate -height 30 -expand -group Outputs sim:/nes_decoder/ready_to_read
add wave -noupdate -height 30 -expand -group Internals sim:/nes_decoder/count
add wave -noupdate -height 30 -expand -group Internals sim:/nes_decoder/next
add wave -noupdate -height 30 -expand -group Internals sim:/nes_decoder/apply
add wave -noupdate -height 30 -expand -group Internals sim:/nes_decoder/tmp_buttons
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {809 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 416
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
WaveRestoreZoom {0 ps} {765 ps}
bookmark add wave bookmark0 {{0 ps} {894 ps}} 0
