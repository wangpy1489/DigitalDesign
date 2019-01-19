module pipeid( mwreg,mrn,ern,ewreg,em2reg,mm2reg,dpc4,inst,
		wrn,wdi,ealu,malu,mmo,wwreg,clock,resetn,
		bpc,jpc,pcsource,wpcir,dwreg,dm2reg,dwmem,daluc,
		daluimm,da,db,dimm,drn,dshift,djal ); 
	
	input 		mwreg,ewreg,em2reg,mm2reg,wwreg;
	input [4:0] ern,mrn,wrn;
	input [31:0] dpc4,inst,ealu,malu,wdi;
	input [31:0] mmo;
	input 		clock,resetn;

	output [1:0] pcsource;
	output [31:0] bpc,jpc;
	output 		wpcir,dwreg,dm2reg,dwmem,daluimm,dshift,djal;
	output [3:0] daluc;
	output [31:0] da,db,dimm;
	output [4:0] drn;
	
	wire [5:0] op,func;
	wire [4:0] rs,rt,rd;
	wire [1:0] fwda,fwdb;
	wire sext,rsrtequ,regrt;
	wire [31:0] qa,qb;
   //wire [31:0]   sa = { 27'b0, inst[10:6] }; // extend to 32 bits from sa for shift instruction
   wire          e = sext & inst[15];          // positive or negative sign at sext signal
   wire [15:0]   ext16 = {16{e}};	// high 16 sign bit 
	assign   dimm = {ext16,inst[15:0]}; // sign extend to high 16
	wire          k = 1'b1 & inst[15];
	wire [15:0]	  signex = {16{k}};
   wire [31:0]   offset = {signex[13:0],inst[15:0],2'b00};   //offset(include sign extend)
	cla32 bpc_pluse(dpc4,offset,32'h0,bpc); //bpc
	assign jpc = {dpc4[31:28],(inst[25:0]<<2)}; //jpc
	mux4x32 da_switch (qa,ealu,malu,mmo,fwda,da);//da
	assign op = inst[31:26];
	assign func = inst [5:0];
	assign rs = inst[25:21];
	assign rt = inst[20:16];
	assign rd = inst [15:11];
	mux4x32 db_switch (qb,ealu,malu,mmo,fwdb,db);
	mux2x5  rn_switch (rd,rt,regrt,drn);
	assign rsrtequ = (da==db);
		


	sc_cu control_unit (mwreg,mrn,ern,ewreg,em2reg,mm2reg,rsrtequ,func,op,rs,rt,
					dwreg,dm2reg,dwmem,daluc,regrt,daluimm,fwda,fwdb,wpcir,sext,
					pcsource,dshift,djal);
					
	regfile reg_file(rs,rt,wdi,wrn,wwreg,clock,resetn,qa,qb);

endmodule
