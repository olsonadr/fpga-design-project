vsim work.SquareWaveGenerator

add wave clk
add wave note
add wave en 
add wave reset_n

add wave speaker 

restart -f
force clk 0 0, 1 {10 ns} -r 20ns
force reset_n 0
force en 1 
run 20ns

force reset_n 1
force note 000
run 3816793 ns

force note 001
run 3401360 ns

force note 010
run 3030303 ns

force note 011
run 2857142 ns

force note 100
run 2551020 ns

force note 101
run 2272727 ns

force note 110
run 2024291 ns

force note 111
run 1912045 ns