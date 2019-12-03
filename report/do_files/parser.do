vsim design-project.parser
add wave -position insertpoint sim:/parser/*

force -freeze sim:/parser/count 0 0
run 50

force -freeze sim:/parser/count 1010001011111100011 0
run 50

force -freeze sim:/parser/count 10101110101000001011000 0
run 50

force -freeze sim:/parser/count 100000101111100010000100000 0
run 50
