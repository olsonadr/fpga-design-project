vsim work.vga_640x480

add wave clock_25
add wave reset_frame

add wave h_sync
add wave v_sync
add wave h_display
add wave v_display

restart -f
force clock_25 0 0, 1 {20ns} -r {40ns}
force reset_frame 0
run 10ns

force reset_frame 1
run 18240000ns