add wave clk_10KHz 
add wave IR 
add wave readControl 
add wave readyToRead 
add wave outputReadyadd wave state 
add wave nextstate 
add wave vcr_out 

force clk 1 0, 0 {50 ns} -r 100 
force stateReset 1 0, 0 100 

force IR 1 0, 0 16901.0, 1 25990.0, 0 30239.0, 1 30982.999999999996, 0 32519.0, 1 33262.0, 0 33666.0, 1 34408.99999999999, 0 34811.99999999999, 1 35558.99999999999, 0 37071.0, 1 37797.0, 0 38218.0, 1 38954.0, 0 39360.0, 1 40124.99999999999, 0 40507.0, 1 41262.0, 0 42787.0, 1 43543.0, 0 43934.0, 1 44689.99999999999, 0 46193.0, 1 46987.0, 0 48456.0, 1 49198.0, 0 49602.0, 1 50379.0, 0 51862.0, 1 52626.0, 0 54104.0, 1 54876.0, 0 56384.0, 1 57157.0, 0 57552.0, 1 58275.0, 0 59810.99999999999, 1 60545.0, 0 60958.0, 1 61703.99999999999, 0 62104.0, 1 62865.00000000001, 0 63247.0, 1 63996.0, 0 64393.00000000001, 1 65147.0, 0 65534.99999999999, 1 66297.0, 0 67799.0, 1 68537.0, 0 68966.0, 1 69743.0, 0 70109.0, 1 70844.99999999999, 0 72371.99999999999, 1 73115.0, 0 74635.0, 1 75406.0, 0 76894.99999999999, 1 77665.0, 0 79137.0, 1 79929.0, 0 81417.0, 1 82195.0, 0 82564.0, 1 83325.0, 0 84823.0, 1 85602.0

run 90000 