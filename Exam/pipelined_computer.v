// Copyright (C) 1991-2013 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"
// CREATED		"Sun Dec 09 17:46:48 2018"

module pipelined_computer(
	reset,
	CLOCK_10,
	SW9,
	SW8,
	SW7,
	SW6,
	SW5,
	SW4,
	SW3,
	SW2,
	SW1,
	SW0,
	HEX0,
	HEX1,
	HEX2,
	HEX3,
	HEX4,
	HEX5
);


input wire	reset;
input wire	CLOCK_10;
input wire	SW9;
input wire	SW8;
input wire	SW7;
input wire	SW6;
input wire	SW5;
input wire	SW4;
input wire	SW3;
input wire	SW2;
input wire	SW1;
input wire	SW0;
output wire	[6:0] HEX0;
output wire	[6:0] HEX1;
output wire	[6:0] HEX2;
output wire	[6:0] HEX3;
output wire	[6:0] HEX4;
output wire	[6:0] HEX5;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	[31:0] SYNTHESIZED_WIRE_2;
wire	[31:0] SYNTHESIZED_WIRE_3;
wire	[31:0] SYNTHESIZED_WIRE_4;
wire	[31:0] SYNTHESIZED_WIRE_5;
wire	[31:0] SYNTHESIZED_WIRE_6;





clock_and_memclock	b2v_Clocks(
	.refclk(CLOCK_10),
	.clock_out(SYNTHESIZED_WIRE_0),
	.mem_clock(SYNTHESIZED_WIRE_1));


pipelined_computer_main	b2v_computer(
	.resetn(reset),
	.clock(SYNTHESIZED_WIRE_0),
	.mem_clock(SYNTHESIZED_WIRE_1),
	.in_port0(SYNTHESIZED_WIRE_2),
	.in_port1(SYNTHESIZED_WIRE_3),
	
	
	
	
	
	.out_port0(SYNTHESIZED_WIRE_4),
	.out_port1(SYNTHESIZED_WIRE_5),
	.out_port2(SYNTHESIZED_WIRE_6)
	
	);


in_port	b2v_in1(
	.sw4(SW9),
	.sw3(SW8),
	.sw2(SW7),
	.sw1(SW6),
	.sw0(SW5),
	.out(SYNTHESIZED_WIRE_2));


in_port	b2v_in2(
	.sw4(SW4),
	.sw3(SW3),
	.sw2(SW2),
	.sw1(SW1),
	.sw0(SW0),
	.out(SYNTHESIZED_WIRE_3));


out_port	b2v_out1(
	.in(SYNTHESIZED_WIRE_4),
	.out0(HEX4),
	.out1(HEX5));


out_port	b2v_out2(
	.in(SYNTHESIZED_WIRE_5),
	.out0(HEX2),
	.out1(HEX3));


out_port	b2v_out3(
	.in(SYNTHESIZED_WIRE_6),
	.out0(HEX0),
	.out1(HEX1));


endmodule
