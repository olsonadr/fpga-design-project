vsim design-project.parsed_clock

add wave -position insertpoint sim:/parsed_clock/clock_50MHz
add wave -position insertpoint sim:/parsed_clock/enable_in
add wave -position insertpoint sim:/parsed_clock/reset_in
add wave -position insertpoint sim:/parsed_clock/double_speed_in
add wave -position insertpoint sim:/parsed_clock/super_speed_in

add wave -position insertpoint sim:/parsed_clock/total_sec

add wave -position insertpoint sim:/parsed_clock/seconds_ones
add wave -position insertpoint sim:/parsed_clock/seconds_tens
add wave -position insertpoint sim:/parsed_clock/minutes_ones
add wave -position insertpoint sim:/parsed_clock/minutes_tens
add wave -position insertpoint sim:/parsed_clock/hours_ones
add wave -position insertpoint sim:/parsed_clock/hours_tens

force -freeze clock_50MHz   0 0,	1  1us	    -r {2us}
force -freeze enable_in	    0 0,	1  1us,      0 {2us}
force -freeze reset_in	    1 0,	0 {1us}

force -freeze double_speed_in  1 0, 0 50000000us, 1 75000000us, 0 {100000000us}
force -freeze super_speed_in   1 0, 0 75000000us

run 150000000us
