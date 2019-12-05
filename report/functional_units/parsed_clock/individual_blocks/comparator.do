vsim design-project.comparator
add wave -position insertpoint sim:/comparator/*
force -freeze sim:/comparator/a 0 0
run 100
force -freeze sim:/comparator/a 0010101000110000000 0
run 100
force -freeze sim:/comparator/a 0010101000101111111 0
run 100
