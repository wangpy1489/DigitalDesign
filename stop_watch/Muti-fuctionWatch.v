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
// CREATED		"Thu Nov 08 23:56:43 2018"

module Muti-fuctionWatch(
	CLOCK_50,
	KEY,
	LED1,
	LED0,
	LED2,
	LED3,
	hex0,
	hex1,
	hex2,
	hex3,
	hex4,
	hex5
);


input wire	CLOCK_50;
input wire	[2:0] KEY;
output wire	LED1;
output wire	LED0;
output wire	LED2;
output wire	LED3;
output wire	[6:0] hex0;
output wire	[6:0] hex1;
output wire	[6:0] hex2;
output wire	[6:0] hex3;
output wire	[6:0] hex4;
output wire	[6:0] hex5;






stopwatch_01	b2v_inst2(
	.clk(CLOCK_50),
	.key_reset(KEY[0]),
	.key_start_pause(KEY[1]),
	.key_display_stop(KEY[2]),
	.led0(LED0),
	.led1(LED1),
	.led2(LED2),
	.led3(LED3),
	.hex0(hex0),
	.hex1(hex1),
	.hex2(hex2),
	.hex3(hex3),
	.hex4(hex4),
	.hex5(hex5));
	defparam	b2v_inst2.DELAY_TIME = 10000000;


endmodule
