vsim work.debounce

add wave clk
add wave button
add wave result 

add wave flipflops

restart -f
force clk 0 0, 1 {10 ns} -r 20ns
force button 0 
run 60 ns

force button 1
run 100 ns

force button 0 
run 50ns 
force button 1
run 50ns