vsim work.ps2_keyboard
# Do file for E

add wave ps2_keyboard/clk
add wave ps2_keyboard/ps2_clk
add wave ps2_keyboard/ps2_data

add wave ps2_keyboard/ps2_code_new
add wave ps2_keyboard/ps2_code

restart -f 
force ps2_keyboard/ps2_clk 1 @ 0 
force ps2_keyboard/ps2_clk 0 @ {615us}	
force ps2_keyboard/ps2_clk 1 @ {659us}
force ps2_keyboard/ps2_clk 0 @ {698us}
force ps2_keyboard/ps2_clk 1 @ {742us}
force ps2_keyboard/ps2_clk 0 @ {782us}
force ps2_keyboard/ps2_clk 1 @ {826us}
force ps2_keyboard/ps2_clk 0 @ {865us}
force ps2_keyboard/ps2_clk 1 @ {910us}
force ps2_keyboard/ps2_clk 0 @ {949us}
force ps2_keyboard/ps2_clk 1 @ {993us}
force ps2_keyboard/ps2_clk 0 @ {1033us}
force ps2_keyboard/ps2_clk 1 @ {1077us}
force ps2_keyboard/ps2_clk 0 @ {1117us}
force ps2_keyboard/ps2_clk 1 @ {1161us}
force ps2_keyboard/ps2_clk 0 @ {1200us}
force ps2_keyboard/ps2_clk 1 @ {1244us}
force ps2_keyboard/ps2_clk 0 @ {1284us}
force ps2_keyboard/ps2_clk 1 @ {1328us}
force ps2_keyboard/ps2_clk 0 @ {1367us}	
force ps2_keyboard/ps2_clk 1 @ {1411us} 
force ps2_keyboard/ps2_clk 0 @ {1451us}
force ps2_keyboard/ps2_clk 1 @ {1495us}

force -freeze sim:ps2_keyboard/clk 0 0, 1 {10 ns} -r 20ns

force ps2_keyboard/ps2_data 1 @ 0
force ps2_keyboard/ps2_data 0 @ {595 us}
force ps2_keyboard/ps2_data 1 @ {847 us}
force ps2_keyboard/ps2_data 0 @ {930 us}
force ps2_keyboard/ps2_data 1 @ {1099 us}
force ps2_keyboard/ps2_data 0 @ {1181 us}
force ps2_keyboard/ps2_data 1 @ {1350 us}

run 2000us