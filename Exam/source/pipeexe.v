module pipeexe( ealuc,ealuimm,ea,eb,eimm,eshift,ern0,epc4,ejal,ern,ealu );
	input 		ealuimm,eshift,ejal;
	input [3:0] ealuc;
	input [31:0] ea,eb,eimm,epc4;
	input [4:0] ern0;
	output [31:0] ealu;
	output [4:0] ern;
	wire [31:0] epc8,sa,ealua,ealub,ealu0;
	wire z;
	assign sa={27'b0,eimm[10:6]};
	cla32 pc4_pluse4(epc4,32'h4,32'h0,epc8);
	mux2x32 e_alua (ea,sa,eshift,ealua);
	mux2x32 e_alub (eb,eimm,ealuimm,ealub);
	alu E_ALU(ealua,ealub,ealuc,ealu0,z);
	mux2x32 e_alu (ealu0,epc8,ejal,ealu);
	// 11111 is return adress register
	assign ern = ern0 | {5{ejal}};
	
	
endmodule