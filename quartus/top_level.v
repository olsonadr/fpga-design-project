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
// CREATED		"Mon Dec  2 15:38:25 2019"

module top_level(
	clock_50Mhz,
	nes_data,
	system_reset_button,
	switch0,
	switch1,
	nes_latch,
	nes_clock,
	L293D_enable_1,
	L293D_enable_2,
	L293D_input_1,
	L293D_input_2,
	L293D_input_3,
	L293D_input_4,
	segs0,
	segs1,
	segs2,
	segs3,
	segs4,
	segs5
);


input wire	clock_50Mhz;
input wire	nes_data;
input wire	system_reset_button;
input wire	switch0;
input wire	switch1;
output wire	nes_latch;
output wire	nes_clock;
output wire	L293D_enable_1;
output wire	L293D_enable_2;
output wire	L293D_input_1;
output wire	L293D_input_2;
output wire	L293D_input_3;
output wire	L293D_input_4;
output wire	[6:0] segs0;
output wire	[6:0] segs1;
output wire	[6:0] segs2;
output wire	[6:0] segs3;
output wire	[6:0] segs4;
output wire	[6:0] segs5;

wire	nes_clock_out;
wire	nes_latch_out;
wire	not_nes_A;
wire	not_nes_B;
wire	not_nes_DOWN;
wire	not_nes_LEFT;
wire	not_nes_RIGHT;
wire	not_nes_SELECT;
wire	not_nes_START;
wire	not_nes_UP;
wire	system_reset;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	[3:0] SYNTHESIZED_WIRE_10;
wire	[3:0] SYNTHESIZED_WIRE_11;
wire	[3:0] SYNTHESIZED_WIRE_12;
wire	[3:0] SYNTHESIZED_WIRE_13;
wire	[3:0] SYNTHESIZED_WIRE_14;
wire	[3:0] SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;





L293D_encoder	b2v_asd(
	.motor_1_on(SYNTHESIZED_WIRE_0),
	.motor_1_dir(SYNTHESIZED_WIRE_1),
	.motor_2_on(SYNTHESIZED_WIRE_2),
	.motor_2_dir(SYNTHESIZED_WIRE_3),
	.enable_1(L293D_enable_1),
	.input_1(L293D_input_1),
	.input_2(L293D_input_2),
	.enable_2(L293D_enable_2),
	.input_3(L293D_input_3),
	.input_4(L293D_input_4));


nes_to_motor	b2v_dsa(
	.left(not_nes_LEFT),
	.right(not_nes_RIGHT),
	.forward(not_nes_UP),
	.backward(not_nes_DOWN),
	.motor_1_on(SYNTHESIZED_WIRE_0),
	.motor_1_dir(SYNTHESIZED_WIRE_1),
	.motor_2_on(SYNTHESIZED_WIRE_2),
	.motor_2_dir(SYNTHESIZED_WIRE_3));



assign	not_nes_LEFT =  ~SYNTHESIZED_WIRE_6;

assign	not_nes_RIGHT =  ~SYNTHESIZED_WIRE_7;

assign	not_nes_UP =  ~SYNTHESIZED_WIRE_8;

assign	not_nes_DOWN =  ~SYNTHESIZED_WIRE_9;


seven_seg_6	b2v_inst4(
	.in0(SYNTHESIZED_WIRE_10),
	.in1(SYNTHESIZED_WIRE_11),
	.in2(SYNTHESIZED_WIRE_12),
	.in3(SYNTHESIZED_WIRE_13),
	.in4(SYNTHESIZED_WIRE_14),
	.in5(SYNTHESIZED_WIRE_15),
	.segs0(segs0),
	.segs1(segs1),
	.segs2(segs2),
	.segs3(segs3),
	.segs4(segs4),
	.segs5(segs5));


parsed_clock	b2v_inst5(
	.clock_50MHz(clock_50Mhz),
	.enable_in(not_nes_A),
	.reset_in(SYNTHESIZED_WIRE_16),
	.double_speed_in(switch0),
	.super_speed_in(switch1),
	.hours_ones(SYNTHESIZED_WIRE_14),
	.hours_tens(SYNTHESIZED_WIRE_15),
	.minutes_ones(SYNTHESIZED_WIRE_12),
	.minutes_tens(SYNTHESIZED_WIRE_13),
	.seconds_ones(SYNTHESIZED_WIRE_10),
	.seconds_tens(SYNTHESIZED_WIRE_11));

assign	system_reset =  ~system_reset_button;

assign	SYNTHESIZED_WIRE_16 = system_reset | not_nes_B;

assign	not_nes_A =  ~SYNTHESIZED_WIRE_17;

assign	not_nes_B =  ~SYNTHESIZED_WIRE_18;


nes_decoder	b2v_wow(
	.nes_data(nes_data),
	.in_clock(clock_50Mhz),
	.read_data(SYNTHESIZED_WIRE_19),
	.reset(system_reset),
	.nes_latch(nes_latch_out),
	.nes_clock(nes_clock_out),
	.nes_A(SYNTHESIZED_WIRE_17),
	.nes_B(SYNTHESIZED_WIRE_18),
	.nes_START(SYNTHESIZED_WIRE_4),
	.nes_SELECT(SYNTHESIZED_WIRE_5),
	.nes_UP(SYNTHESIZED_WIRE_8),
	.nes_DOWN(SYNTHESIZED_WIRE_9),
	.nes_LEFT(SYNTHESIZED_WIRE_6),
	.nes_RIGHT(SYNTHESIZED_WIRE_7),
	.ready_to_read(SYNTHESIZED_WIRE_19));

assign	nes_latch = nes_latch_out;
assign	nes_clock = nes_clock_out;

endmodule
