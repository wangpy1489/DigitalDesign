module pipemwreg ( mwreg,mm2reg,mmo,malu,mrn,clock,resetn,
	wwreg,wm2reg,wmo,walu,wrn);
	input 		mwreg,mm2reg;
	input [31:0] mmo,malu;
	input [4:0] mrn;
	input 		clock,resetn;
	output 		wwreg,wm2reg;
	output [31:0] wmo,walu;
	output [4:0] wrn;
	
	dff1 w_wreg(mwreg,clock,resetn,wwreg);
	dff1 w_m2reg(mm2reg,clock,resetn,wm2reg);
	
	dff5 w_rn (mrn,clock,resetn,wrn);
	
	dff32 w_mo (mmo,clock,resetn,wmo);
	dff32 w_alu (malu,clock,resetn,walu);
	
endmodule