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
// CREATED		"Tue Dec  3 13:43:58 2019"

module enable_flip_flop(
	reset,
	enable_in,
	enable_out
);


input wire	reset;
input wire	enable_in;
output reg	enable_out;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;

assign	SYNTHESIZED_WIRE_1 = 1;




always@(posedge enable_in or negedge SYNTHESIZED_WIRE_0)
begin
if (!SYNTHESIZED_WIRE_0)
	begin
	enable_out <= 0;
	end
else
	enable_out <= enable_out ^ SYNTHESIZED_WIRE_1;
end


assign	SYNTHESIZED_WIRE_0 =  ~reset;


endmodule
