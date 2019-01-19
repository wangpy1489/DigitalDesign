module VgaGame_main(clk, reset_n,R_clock_25M,VGA_R,VGA_G,VGA_B,sync_h, sync_v, blank_n);
	input reset_n;
	input clk;
	output R_clock_25M;
	output [7:0] VGA_R,VGA_G,VGA_B;
	output sync_h, sync_v, blank_n;
	
	wire [9:0] row_i,col_i;
	wire [7:0] VGA_R,VGA_G,VGA_B;

	assign VGA_R = 0;
	assign VGA_G = 0;
	assign VGA_B = 255;
	
	vga640x480 vag_show (clk, R_clock_25M, reset_n, sync_h, sync_v, blank_n, col_i, row_i);
	

		
endmodule