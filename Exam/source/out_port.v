module out_port(in,out1,out0);
	input [31:0] in;
	output [6:0] out1,out0;
	
	reg [3:0] high, low;

	sevenseg display_1( high, out1 );
	sevenseg display_0( low, out0 );
	
	always @ (in)
	begin
		high <= (in / 10) % 10;
		low  <= in % 10;
	end
	
endmodule