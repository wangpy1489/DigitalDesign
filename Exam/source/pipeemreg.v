module pipeemreg( ewreg,em2reg,ewmem,ealu,eb,ern,clock,resetn,
	mwreg,mm2reg,mwmem,malu,mb,mrn);
	input 		ewreg,em2reg,ewmem;
	input [31:0] ealu,eb;
	input [4:0] ern;
	input 		clock,resetn;
	output 		mwreg,mm2reg,mwmem;
	output [31:0] malu,mb;
	output [4:0] mrn;
	
	dff1 m_wreg(ewreg,clock,resetn,mwreg);
	dff1 m_m2reg(em2reg,clock,resetn,mm2reg);
	dff1 m_wmem(ewmem,clock,resetn,mwmem);
	
	dff32 m_alu (ealu,clock,resetn,malu);
	dff32 m_b (eb,clock,resetn,mb);
	
	dff5 m_rn (ern,clock,resetn,mrn);
endmodule