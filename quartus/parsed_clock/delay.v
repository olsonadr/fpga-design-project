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
// CREATED		"Mon Dec  2 19:57:32 2019"

module delay(
	clock_in,
	enable,
	reset,
	double_speed,
	super_speed,
	clock_out
);


input wire	clock_in;
input wire	enable;
input wire	reset;
input wire	double_speed;
input wire	super_speed;
output wire	clock_out;

reg	[3:0] clock_option;
wire	[0:1] select;
wire	SYNTHESIZED_WIRE_11;
reg	TFF_inst8;
reg	TFF_inst10;
reg	TFF_inst11;
reg	TFF_inst9;
reg	TFFE_inst6;
wire	SYNTHESIZED_WIRE_6;
reg	TFF_inst5;

assign	SYNTHESIZED_WIRE_6 = 1;





always@(posedge TFF_inst8 or negedge SYNTHESIZED_WIRE_11)
begin
if (!SYNTHESIZED_WIRE_11)
	begin
	TFF_inst10 <= 1;
	end
else
	TFF_inst10 <= TFF_inst10 ^ clock_in;
end


always@(posedge TFF_inst10 or negedge SYNTHESIZED_WIRE_11)
begin
if (!SYNTHESIZED_WIRE_11)
	begin
	TFF_inst11 <= 1;
	end
else
	TFF_inst11 <= TFF_inst11 ^ clock_in;
end


always@(posedge TFF_inst11 or negedge SYNTHESIZED_WIRE_11)
begin
if (!SYNTHESIZED_WIRE_11)
	begin
	clock_option[1] <= 1;
	end
else
	clock_option[1] <= clock_option[1] ^ clock_in;
end

assign	SYNTHESIZED_WIRE_11 =  ~reset;


mux_0	b2v_inst2(
	.data(clock_option),
	.sel(select),
	.result(clock_out));


always@(posedge TFF_inst9 or negedge SYNTHESIZED_WIRE_11)
begin
if (!SYNTHESIZED_WIRE_11)
	begin
	clock_option[3] <= 1;
	end
else
	clock_option[3] <= clock_option[3] ^ clock_in;
end


always@(posedge clock_option[1] or negedge SYNTHESIZED_WIRE_11)
begin
if (!SYNTHESIZED_WIRE_11)
	begin
	clock_option[0] <= 1;
	end
else
	clock_option[0] <= clock_option[0] ^ clock_in;
end


always@(posedge TFFE_inst6 or negedge SYNTHESIZED_WIRE_11)
begin
if (!SYNTHESIZED_WIRE_11)
	begin
	TFF_inst5 <= 1;
	end
else
	TFF_inst5 <= TFF_inst5 ^ clock_in;
end


always@(posedge clock_in or negedge SYNTHESIZED_WIRE_11)
begin
if (!SYNTHESIZED_WIRE_11)
	begin
	TFFE_inst6 <= 1;
	end
else
if (enable)
	begin
	TFFE_inst6 <= TFFE_inst6 ^ SYNTHESIZED_WIRE_6;
	end
end


always@(posedge clock_option[3] or negedge SYNTHESIZED_WIRE_11)
begin
if (!SYNTHESIZED_WIRE_11)
	begin
	clock_option[2] <= 1;
	end
else
	clock_option[2] <= clock_option[2] ^ clock_in;
end


always@(posedge clock_option[2] or negedge SYNTHESIZED_WIRE_11)
begin
if (!SYNTHESIZED_WIRE_11)
	begin
	TFF_inst8 <= 1;
	end
else
	TFF_inst8 <= TFF_inst8 ^ clock_in;
end


always@(posedge TFF_inst5 or negedge SYNTHESIZED_WIRE_11)
begin
if (!SYNTHESIZED_WIRE_11)
	begin
	TFF_inst9 <= 1;
	end
else
	TFF_inst9 <= TFF_inst9 ^ clock_in;
end

assign	select[0] = double_speed;
assign	select[1] = super_speed;

endmodule

module mux_0(data,sel,result);
/* synthesis black_box */

input [3:0] data;
input [1:0] sel;
output result;

endmodule
