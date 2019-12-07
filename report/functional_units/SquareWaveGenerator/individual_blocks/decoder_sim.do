vsim work.decoder

add wave a 
add wave y

restart -f
force a 00011100
run 20 ns

force a 00011011
run 20 ns

force a 00100011
run 20 ns

force a 00101011
run 20 ns

force a 00011101
run 20 ns

force a 00100100
run 20 ns

force a 00101101
run 20 ns

force a 00101100
run 20 ns
