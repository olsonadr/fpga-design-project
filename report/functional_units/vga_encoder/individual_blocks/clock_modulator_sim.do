vsim work.clock_modulator

add wave clock_in
add wave clock_out

force clock_in 1 0, 0 {50 ns} -r 100

run 5000
