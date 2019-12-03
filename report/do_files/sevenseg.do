vsim design-project.sevenseg
add wave -position insertpoint sim:/sevenseg/*

force -freeze sim:/sevenseg/data 0000 0
run 50

force -freeze sim:/sevenseg/data 0001 0
run 50

force -freeze sim:/sevenseg/data 0010 0
run 50

force -freeze sim:/sevenseg/data 0011 0
run 50

force -freeze sim:/sevenseg/data 0100 0
run 50

force -freeze sim:/sevenseg/data 0101 0
run 50

force -freeze sim:/sevenseg/data 0110 0
run 50

force -freeze sim:/sevenseg/data 0111 0
run 50

force -freeze sim:/sevenseg/data 1000 0
run 50

force -freeze sim:/sevenseg/data 1001 0
run 50
