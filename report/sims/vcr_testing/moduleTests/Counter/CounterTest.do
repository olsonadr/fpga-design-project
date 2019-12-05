vsim work.Counter

add wave clk
add wave reset
add wave q

force clk 1 0, 0 50 {50 ns} -r 100
force reset 1 0, 0 10, 1 1000

run 1200
