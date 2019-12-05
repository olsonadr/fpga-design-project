vsim work.ReadState 

add wave clk 
add wave IR 
add wave readSignal 
add wave shiftValue 
add wave state 
add wave nextstate 
add wave outputValue 

force clk 1 0, 0 {50 ns} -r 100 
force start 1 0 

force IR 0 1, 1 31042.999999999996, 0 32500.0, 1 33287.0, 0 33668.0, 1 34448.0, 0 34814.0, 1 35593.0, 0 37052.0, 1 37859.0, 0 38220.0, 1 38982.0, 0 39362.99999999999, 1 40132.0, 0 40509.0, 1 41266.0, 0 42789.99999999999, 1 43564.0, 0 43937.0, 1 44694.0, 0 46196.0, 1 46964.0, 0 48459.99999999999, 1 49225.0, 0 49606.0, 1 50380.99999999999, 0 51844.0, 1 52672.0, 0 54129.0, 1 54902.0, 0 56388.0, 1 57166.0, 0 57555.99999999999, 1 58313.0, 0 58698.0, 1 59486.0, 0 59844.99999999999, 1 60672.0, 0 60987.0, 1 61755.0, 0 62134.0, 1 62897.99999999999, 0 63276.0, 1 64058.00000000001, 0 64423.00000000001, 1 65182.99999999999, 0 66681.99999999999, 1 67437.0, 0 67848.99999999999, 1 68669.00000000001, 0 70113.00000000001, 1 70869.0, 0 72377.0, 1 73129.0, 0 74615.0, 1 75391.0, 0 76900.0, 1 77667.0, 0 79159.0, 1 79946.0, 0 81402.0, 1 82172.0, 0 82569.0, 1 83330.0, 0 84803.0, 1 85616.0

run 90000 