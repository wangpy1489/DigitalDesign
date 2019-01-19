module pipedereg( dwreg,dm2reg,dwmem,daluc,daluimm,da,db,dimm,drn,dshift,
	djal,dpc4,clock,resetn,ewreg,em2reg,ewmem,ealuc,ealuimm,
	ea,eb,eimm,ern0,eshift,ejal,epc4 );
	input 		dwreg,dm2reg,dwmem,djal,daluimm,dshift;
	input [31:0] dpc4,da,db,dimm;
	input [4:0] drn;
	input [3:0]	daluc;
	input 		clock,resetn;
	output 		ewreg,em2reg,ewmem,ejal,ealuimm,eshift;
	output [3:0]	ealuc;
	output [31:0] epc4,ea,eb,eimm;
	output [4:0] ern0;
	dff1 e_wreg(dwreg,clock,resetn,ewreg);
	dff1 e_m2reg(dm2reg,clock,resetn,em2reg);
	dff1 e_wmem(dwmem,clock,resetn,ewmem);
	dff1 e_jal(djal,clock,resetn,ejal);
	dff1 e_aluimm(daluimm,clock,resetn,ealuimm);
	dff1 e_shift(dshift,clock,resetn,eshift);
	
	dff4 e_aluc(daluc,clock,resetn,ealuc);
	
	dff5 e_ern0(drn,clock,resetn,ern0);
	
	dff32 e_pc4 (dpc4,clock,resetn,epc4);
	dff32 e_a (da,clock,resetn,ea);
	dff32 e_b (db,clock,resetn,eb);
	dff32 e_imm (dimm,clock,resetn,eimm);
endmodule