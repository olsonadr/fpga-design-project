vsim work.rgb_decoder

add wave red_in
add wave green_in
add wave blue_in

add wave red_out
add wave green_out
add wave blue_out

restart -f
force red_in 00
force green_in 01
force blue_in 10
run 20ns

force red_in 01
force green_in 10
force blue_in 11
run 20ns

force red_in 00
force green_in 00
force blue_in 00
run 20ns

force red_in 11
force green_in 11
force blue_in 11
run 20ns