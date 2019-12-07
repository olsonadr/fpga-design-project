vsim work.clock_modulator

add wave clock_in
add wave clock_out

restart -f
force clock_in 0 0, 1 {10 ns} -r 20ns
run 100ns