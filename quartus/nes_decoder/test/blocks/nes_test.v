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
// CREATED		"Wed Nov 20 19:21:41 2019"

module nes_test(
	B,
	A,
	START,
	SELECT,
	UP,
	DOWN,
	LEFT,
	RIGHT,
	CLOCK,
	READ_CLOCK,
	RESET,
	A_out,
	B_out,
	START_out,
	SELECT_out,
	DOWN_out,
	LEFT_out,
	RIGHT_out,
	UP_out
);


input wire	B;
input wire	A;
input wire	START;
input wire	SELECT;
input wire	UP;
input wire	DOWN;
input wire	LEFT;
input wire	RIGHT;
input wire	CLOCK;
input wire	READ_CLOCK;
input wire	RESET;
output wire	A_out;
output wire	B_out;
output wire	START_out;
output wire	SELECT_out;
output wire	DOWN_out;
output wire	LEFT_out;
output wire	RIGHT_out;
output wire	UP_out;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;





nes_test_controller	b2v_inst(
	.nes_latch(SYNTHESIZED_WIRE_0),
	.nes_clock(SYNTHESIZED_WIRE_1),
	.in_A(A),
	.in_B(B),
	.in_START(START),
	.in_SELECT(SELECT),
	.in_UP(UP),
	.in_DOWN(DOWN),
	.in_LEFT(LEFT),
	.in_RIGHT(RIGHT),
	.nes_data(SYNTHESIZED_WIRE_2));


nes_decoder	b2v_inst5(
	.nes_data(SYNTHESIZED_WIRE_2),
	.in_clock(CLOCK),
	.read_data(SYNTHESIZED_WIRE_3),
	.reset(RESET),
	.nes_latch(SYNTHESIZED_WIRE_0),
	.nes_clock(SYNTHESIZED_WIRE_1),
	.nes_A(A_out),
	.nes_B(B_out),
	.nes_START(START_out),
	.nes_SELECT(SELECT_out),
	.nes_UP(UP_out),
	.nes_DOWN(DOWN_out),
	.nes_LEFT(LEFT_out),
	.nes_RIGHT(RIGHT_out),
	.ready_to_read(SYNTHESIZED_WIRE_4));

assign	SYNTHESIZED_WIRE_3 = READ_CLOCK & SYNTHESIZED_WIRE_4;


endmodule
