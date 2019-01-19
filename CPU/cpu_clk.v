module cpu_clk(inclk, outclk);
	input      inclk;
	output reg outclk;

	initial begin
		outclk <= 0;
	end

	always @(posedge inclk)
		outclk <= ~outclk;
endmodule

	