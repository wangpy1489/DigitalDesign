module clock_and_memclock(refclk,clock_out,mem_clock);
	input refclk;
	output reg clock_out; 
	output reg mem_clock;
	
	
	
	always @(refclk) begin
		clock_out <= ~refclk;
		mem_clock <=  refclk;
	end
	
endmodule