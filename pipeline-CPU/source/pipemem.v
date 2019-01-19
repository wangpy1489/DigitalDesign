module pipemem( mwmem,malu,mb,clock,mem_clock,mmo ,out_port0,out_port1,out_port2,in_port0,in_port1,mem_dataout,io_read_data,io_out);
	input 		mwmem,clock,mem_clock;
	input[31:0] malu,mb,in_port0,in_port1;
	output [31:0] mmo,out_port0,out_port1,out_port2,mem_dataout,io_read_data;
	output io_out;
	sc_datamem datamem(malu,mb,mmo,mwmem,clock,mem_clock,out_port0,out_port1,out_port2,in_port0,in_port1,mem_dataout,io_read_data,io_out);
	
endmodule
