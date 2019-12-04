add wave clk
add wave sin
add wave q

force clk 1 0, 0 {50 ns} -r 100
force sin 1 0, 0 500, 1 1000

run 1500
