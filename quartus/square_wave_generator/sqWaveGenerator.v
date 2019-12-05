// Copyright (C) 2018  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"
// CREATED		"Wed Dec 04 00:29:37 2019"

module sqWaveGenerator(
	clk_50MHz,
	en,
	ps2_code,
	sqWave
);


input wire	clk_50MHz;
input wire	en;
input wire	[7:0] ps2_code;
output wire	sqWave;

wire	[2:0] SYNTHESIZED_WIRE_0;





SquareWaveGenerator	b2v_inst(
	.clk(clk_50MHz),
	.en(en),
	.note(SYNTHESIZED_WIRE_0),
	.speaker(sqWave));


decoder	b2v_inst23(
	.a(ps2_code),
	.y(SYNTHESIZED_WIRE_0));


endmodule
