vsim work.vga_640x480_sim

add wave clock_25

add wave h_sync
add wave h_display
add wave h_count

add wave v_sync
add wave v_display
add wave v_count


force clock_25 1 0, 0 {50 ns} -r 100

run 900000
