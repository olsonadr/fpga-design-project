vsim work.vcr_decoder

add wave clk_10KHz 
add wave IR 
add wave readControl 
add wave readyToRead 
add wave outputReadyadd wave state 
add wave nextstate 
add wave vcr_out 

force clk 1 0, 0 {50 ns} -r 100 
force stateReset 1 0, 0 100 

force IR 1 0, 0 16901.0, 1 25989.0, 0 30258.0, 1 30994.0, 0 32501.000000000004, 1 33269.0, 0 33664.0, 1 34434.99999999999, 0 34810.99999999999, 1 35578.0, 0 37049.0, 1 37848.99999999999, 0 38217.0, 1 39000.0, 0 39363.99999999999, 1 40140.99999999999, 0 40506.0, 1 41285.0, 0 42765.0, 1 43583.0, 0 43933.0, 1 44704.99999999999, 0 46193.0, 1 46978.0, 0 48456.0, 1 49229.99999999999, 0 49603.0, 1 50381.99999999999, 0 51862.0, 1 52642.0, 0 54105.0, 1 54903.0, 0 56386.0, 1 57176.0, 0 57548.99999999999, 1 58296.0, 0 58696.0, 1 59419.0, 0 59843.0, 1 60644.0, 0 60985.0, 1 61755.0, 0 63224.0, 1 64032.00000000001, 0 64391.00000000001, 1 65157.99999999999, 0 65538.0, 1 66295.0, 0 67798.0, 1 68587.0, 0 68965.0, 1 69723.0, 0 71229.0, 1 71983.99999999999, 0 73488.0, 1 74258.99999999999, 0 75752.0, 1 76513.0, 0 76898.0, 1 77688.0, 0 79158.0, 1 79919.0, 0 81422.0, 1 82210.0, 0 82564.0, 1 83333.0, 0 84802.0, 1 85594.0

run 90000 