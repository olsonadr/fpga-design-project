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
// CREATED		"Mon Dec  2 15:35:10 2019"

module seven_seg_6(
	in0,
	in1,
	in2,
	in3,
	in4,
	in5,
	segs0,
	segs1,
	segs2,
	segs3,
	segs4,
	segs5
);


input wire	[3:0] in0;
input wire	[3:0] in1;
input wire	[3:0] in2;
input wire	[3:0] in3;
input wire	[3:0] in4;
input wire	[3:0] in5;
output wire	[6:0] segs0;
output wire	[6:0] segs1;
output wire	[6:0] segs2;
output wire	[6:0] segs3;
output wire	[6:0] segs4;
output wire	[6:0] segs5;






sevenseg	b2v_inst(
	.data(in0),
	.segments(segs0));


sevenseg	b2v_inst1(
	.data(in1),
	.segments(segs1));


sevenseg	b2v_inst2(
	.data(in2),
	.segments(segs2));


sevenseg	b2v_inst3(
	.data(in3),
	.segments(segs3));


sevenseg	b2v_inst4(
	.data(in4),
	.segments(segs4));


sevenseg	b2v_inst5(
	.data(in5),
	.segments(segs5));


endmodule
