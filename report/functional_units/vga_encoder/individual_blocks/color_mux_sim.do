vsim work.color_mux

add wave hdisplay
add wave vdisplay
add wave display_in
add wave blue_in
add wave green_in
add wave red_in
add wave blue_out
add wave green_out
add wave red_out

restart -f
force hdisplay 0
force vdisplay 0
force display_in 0

force blue_in 11
force green_in 11
force red_in 11
run 10ns

force hdisplay 1
run 10ns 

force vdisplay 1
run 10ns

force hdisplay 0
run 10ns

force display_in 1
force hdisplay 0
force vdisplay 0
run 10ns

force hdisplay 1
run 10ns 
force vdisplay 1
run 10ns
force hdisplay 0
run 10ns
