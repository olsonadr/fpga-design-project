vsim design-project.enable_flip_flop

add wave -position insertpoint sim:/enable_flip_flop/enable_in
add wave -position insertpoint sim:/enable_flip_flop/reset
add wave -position insertpoint sim:/enable_flip_flop/enable_out

force -freeze enable_in	    0 0,    1  50    -r {100}
force -freeze reset	    1 0,    0 {10}

run 400
