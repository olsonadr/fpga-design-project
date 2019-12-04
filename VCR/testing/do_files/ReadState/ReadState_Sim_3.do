add wave clk 
add wave IR 
add wave readSignal 
add wave shiftValue 
add wave state 
add wave nextstate 
add wave outputValue 

force clk 1 0, 0 {50 ns} -r 100 
force start 1 0 

force IR 0 1, 1 31024.999999999996, 0 32520.999999999993, 1 33242.99999999999, 0 33668.0, 1 34431.0, 0 34809.99999999999, 1 35543.0, 0 37073.99999999999, 1 37834.0, 0 38216.0, 1 38972.0, 0 39362.99999999999, 1 40119.0, 0 40505.0, 1 41248.99999999999, 0 42786.0, 1 43560.0, 0 43932.0, 1 44687.0, 0 46174.99999999999, 1 46965.99999999999, 0 48455.0, 1 49247.0, 0 49602.0, 1 50388.99999999999, 0 51861.0, 1 52604.0, 0 54125.0, 1 54876.99999999999, 0 56384.0, 1 57142.0, 0 57552.0, 1 58313.0, 0 58693.99999999999, 1 59463.99999999999, 0 60937.0, 1 61734.0, 0 62099.99999999999, 1 62854.99999999999, 0 63247.0, 1 63986.999999999985, 0 64389.0, 1 65165.0, 0 65536.0, 1 66282.00000000001, 0 67800.0, 1 68539.99999999999, 0 68963.0, 1 69747.0, 0 71205.99999999999, 1 71991.0, 0 72373.0, 1 73117.0, 0 74633.0, 1 75410.0, 0 76895.99999999999, 1 77633.00000000001, 0 79156.0, 1 79902.0, 0 81419.99999999999, 1 82179.0, 0 82562.0, 1 83287.0, 0 84821.0, 1 85590.0

run 90000 