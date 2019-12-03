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
// CREATED		"Mon Dec  2 15:34:54 2019"

module parsed_clock(
	clock_50MHz,
	enable_in,
	reset_in,
	double_speed_in,
	super_speed_in,
	hours_ones,
	hours_tens,
	minutes_ones,
	minutes_tens,
	seconds_ones,
	seconds_tens
);


input wire	clock_50MHz;
input wire	enable_in;
input wire	reset_in;
input wire	double_speed_in;
input wire	super_speed_in;
output wire	[3:0] hours_ones;
output wire	[3:0] hours_tens;
output wire	[3:0] minutes_ones;
output wire	[3:0] minutes_tens;
output wire	[3:0] seconds_ones;
output wire	[3:0] seconds_tens;

wire	[29:0] total_sec;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_3;
wire	[29:0] SYNTHESIZED_WIRE_4;





counter	b2v_inst(
	.clk(SYNTHESIZED_WIRE_0),
	.reset(SYNTHESIZED_WIRE_1),
	.enable(SYNTHESIZED_WIRE_6),
	.q(SYNTHESIZED_WIRE_4));
	defparam	b2v_inst.N = 30;


comparator	b2v_inst1(
	.a(total_sec),
	.agt24h(SYNTHESIZED_WIRE_3));
	defparam	b2v_inst1.N = 30;

assign	SYNTHESIZED_WIRE_1 = SYNTHESIZED_WIRE_3 | reset_in;


parser	b2v_inst3(
	.count(SYNTHESIZED_WIRE_4),
	.hours_ones(hours_ones),
	.hours_tens(hours_tens),
	.minutes_ones(minutes_ones),
	.minutes_tens(minutes_tens),
	.seconds_ones(seconds_ones),
	.seconds_tens(seconds_tens),
	.total_seconds(total_sec));
	defparam	b2v_inst3.IN_BITS = 30;
	defparam	b2v_inst3.TICK_PER_SEC = 9537;


delay	b2v_inst6(
	.double_speed(double_speed_in),
	.super_speed(super_speed_in),
	.clock_in(clock_50MHz),
	.enable(SYNTHESIZED_WIRE_6),
	.reset(reset_in),
	.clock_out(SYNTHESIZED_WIRE_0));


enable_flip_flop	b2v_inst7(
	.reset(reset_in),
	.enable_in(enable_in),
	.enable_out(SYNTHESIZED_WIRE_6));


endmodule
