vsim work.rgb_decoder

add wave red_in
add wave green_in
add wave blue_in

add wave red_out
add wave green_out
add wave blue_out

force red_in 0 0, 1 200, 2 400, 3 600
force green_in 0 0, 1 200, 2 400, 3 600
force blue_in 0 0, 1 200, 2 400, 3 600

run 1000
