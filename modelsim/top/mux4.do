vsim design-project.mux4
add wave -position insertpoint sim:/mux4/*


force -freeze {in[0]} 0000 {0}
force -freeze {in[1]} 0011 {0}
force -freeze {in[2]} 1100 {0}
force -freeze {in[3]} 1111 {0}

force -freeze sel 00 0, 01 50, 10 100, 11 {150}

run 200
