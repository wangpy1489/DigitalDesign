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
// CREATED		"Wed Jan 02 20:16:53 2019"

module VGAagain(
	clk_50M,
	reset,
	vga_clk,
	hs,
	hv,
	rdn,
	b,
	g,
	r
);


input wire	clk_50M;
input wire	reset;
output wire	vga_clk;
output wire	hs;
output wire	hv;
output wire	rdn;
output wire	[7:0] b;
output wire	[7:0] g;
output wire	[7:0] r;

VgaGame_main	b2v_inst(
	.clk(clk_50M),
	.reset_n(reset),
	.R_clock_25M(vga_clk),
	.sync_h(hs),
	.sync_v(hv),
	.blank_n(rdn),
	.VGA_B(b),
	.VGA_G(g),
	.VGA_R(r));

endmodule
