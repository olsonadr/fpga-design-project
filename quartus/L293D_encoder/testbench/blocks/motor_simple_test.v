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
// CREATED		"Thu Nov 21 13:25:26 2019"

module motor_simple_test(
	motor_1_on,
	motor_1_dir,
	motor_2_on,
	motor_2_dir,
	output_1,
	output_2,
	output_3,
	output_4
);


input wire	motor_1_on;
input wire	motor_1_dir;
input wire	motor_2_on;
input wire	motor_2_dir;
output wire	output_1;
output wire	output_2;
output wire	output_3;
output wire	output_4;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;





L293D_encoder	b2v_inst(
	.motor_1_on(motor_1_on),
	.motor_1_dir(motor_1_dir),
	.motor_2_on(motor_2_on),
	.motor_2_dir(motor_2_dir),
	.enable_1(SYNTHESIZED_WIRE_0),
	.input_1(SYNTHESIZED_WIRE_1),
	.input_2(SYNTHESIZED_WIRE_2),
	.enable_2(SYNTHESIZED_WIRE_3),
	.input_3(SYNTHESIZED_WIRE_4),
	.input_4(SYNTHESIZED_WIRE_5));


L293D_test_chip	b2v_inst1(
	.enable_1(SYNTHESIZED_WIRE_0),
	.input_1(SYNTHESIZED_WIRE_1),
	.input_2(SYNTHESIZED_WIRE_2),
	.enable_2(SYNTHESIZED_WIRE_3),
	.input_3(SYNTHESIZED_WIRE_4),
	.input_4(SYNTHESIZED_WIRE_5),
	.output_1(output_1),
	.output_2(output_2),
	.output_3(output_3),
	.output_4(output_4));


endmodule
