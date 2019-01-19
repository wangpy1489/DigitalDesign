module sc_datamem (addr,datain,dataout,we,clock,mem_clk
							,out_port0,out_port1,out_port2,in_port0,in_port1,mem_dataout,io_read_data,write_io_output_reg_enable);
 
   input  [31:0]  addr;
   input  [31:0]  datain;
   
   input          we, clock,mem_clk;
	input [31:0] in_port0,in_port1;
   output [31:0]  dataout;

   output [31:0] out_port0,out_port1,out_port2;
	output [31:0] mem_dataout;
	output [31:0] io_read_data;
	output    	write_io_output_reg_enable;
	wire 			write_datamem_enable;
	wire [31:0] mem_dataout;
	wire 			write_io_output_reg_enable;
	wire        dmem_clk;    
   wire        write_enable; 
	wire [31:0] dataout;
	
	//wire write_data_enable;
	
	
	assign         write_enable = we ; 
	

	
   //assign dmem_clk = mem_clk; //注意
	//assign write_enable = we & ~clock; //注意
	assign write_datamem_enable = write_enable & ( ~ addr[7]); //mem
	assign write_io_output_reg_enable = write_enable & ( addr[7]); //IO
   
// module mux2x32 (a0,a1,s,y);
// when address[7]=0, means the access is to the datamem.
// that is, the address space of datamem is from 000000 to 011111 word(4 bytes)
	mux2x32 mem_io_dataout_mux(mem_dataout,io_read_data,addr[7],dataout);
	
// when address[7]=1, means the access is to the I/O space.
// that is, the address space of I/O is from 100000 to 111111 word(4 bytes)
   lpm_ram_dq_dram  dram(addr[6:2],mem_clk,datain,write_datamem_enable,mem_dataout  );
	
	io_output_reg io_output_regx2 (addr,datain,write_io_output_reg_enable,
											mem_clk,out_port0,out_port1,out_port2);
// module io_output_reg (addr,datain,write_io_enable,io_clk,clrn,out_port0,out_port1 );
	io_input_reg io_input_regx2(addr,mem_clk,io_read_data,in_port0,in_port1);
// module io_input_reg (addr,io_clk,io_read_data,in_port0,in_port1);
	

endmodule 