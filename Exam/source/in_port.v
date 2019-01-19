module in_port (
	sw4,sw3,sw2,sw1,sw0,out
);

	input sw4,sw3,sw2,sw1,sw0;
	output [31:0] out;
	wire [4:0] in_num;
	wire [26:0]extend = {27{1'b0}};
   assign in_num[4:0] = {sw4,sw3,sw2,sw1,sw0};
	assign out = {extend,in_num[4:0]};

endmodule