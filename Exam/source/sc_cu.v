module sc_cu (mwreg,mrn,ern,ewreg,em2reg,mm2reg,rsrtequ,func,op,rs,rt,
					wreg,m2reg,wmem,aluc,regrt,aluimm,fwda,fwdb,wpcir,sext,
					pcsource,shift,jal);	
   input  [5:0] op,func;
	input	 [4:0] rs,rt,mrn,ern;
   input        rsrtequ;
	input			 mwreg,ewreg,em2reg,mm2reg;
   output       wreg,regrt,jal,m2reg,shift,aluimm,sext,wmem;
   output [3:0] aluc;
   output [1:0] pcsource;
	output [1:0] fwda,fwdb;
	output 		 wpcir;
	reg[1:0]		 fwda,fwdb;
   wire r_type = ~|op;
   wire i_add = r_type & func[5] & ~func[4] & ~func[3] &
                ~func[2] & ~func[1] & ~func[0];    //10 0000
   wire i_sub = r_type & func[5] & ~func[4] & ~func[3] &
                ~func[2] &  func[1] & ~func[0];    //10 0010
      
   //  please complete the deleted code.
   
   wire i_and =  r_type & func[5] & ~func[4] & ~func[3] &
                func[2] & ~func[1] & ~func[0];     //10 0100
   wire i_or  = r_type & func[5] & ~func[4] & ~func[3] &
                func[2] & ~func[1] & func[0]; 		//10 0101

   wire i_xor = r_type & func[5] & ~func[4] & ~func[3] &
                func[2] & func[1] & ~func[0]; 		//10 0110
   wire i_sll = r_type & ~func[5] & ~func[4] & ~func[3] &
                ~func[2] & ~func[1] & ~func[0]; 	//00 0000
   wire i_srl = r_type & ~func[5] & ~func[4] & ~func[3] &
                ~func[2] & func[1] & ~func[0]; 		//00 0010
   wire i_sra = r_type & ~func[5] & ~func[4] & ~func[3] &
                ~func[2] & func[1] & func[0]; 		//00 0011
   wire i_jr  = r_type & ~func[5] & ~func[4] & func[3] &
                ~func[2] & ~func[1] & ~func[0];  	//00 1000
                
   wire i_addi = ~op[5] & ~op[4] &  op[3] & ~op[2] & ~op[1] & ~op[0]; //001000
   wire i_andi = ~op[5] & ~op[4] &  op[3] &  op[2] & ~op[1] & ~op[0]; //001100
   wire i_ori  = ~op[5] & ~op[4] &  op[3] &  op[2] & ~op[1] &  op[0]; //001101
   wire i_xori = ~op[5] & ~op[4] &  op[3] &  op[2] &  op[1] & ~op[0]; //001110
   wire i_lw   =  op[5] & ~op[4] & ~op[3] & ~op[2] &  op[1] &  op[0]; //100011  
   wire i_sw   =  op[5] & ~op[4] &  op[3] & ~op[2] &  op[1] &  op[0]; //101011 
   wire i_beq  = ~op[5] & ~op[4] & ~op[3] &  op[2] & ~op[1] & ~op[0]; //000100
   wire i_bne  = ~op[5] & ~op[4] & ~op[3] &  op[2] & ~op[1] &  op[0];  //000101 
   wire i_lui  = ~op[5] & ~op[4] &  op[3] &  op[2] &  op[1] &  op[0]; //001111
   wire i_j    = ~op[5] & ~op[4] & ~op[3] & ~op[2] &  op[1] & ~op[0]; //000010
   wire i_jal  = ~op[5] & ~op[4] & ~op[3] & ~op[2] &  op[1] &  op[0]; //000011
   //use rs
	wire i_rs = i_add | i_sub | i_and | i_or | i_xor | i_jr | i_addi |
					i_andi | i_ori | i_xori | i_lw | i_sw | i_beq | i_bne;
	//use rt				
	wire i_rt = i_add | i_sub | i_and | i_or | i_xor | i_sll | i_srl |
					i_sra | i_sw | i_beq | i_bne;
					
	assign wpcir = ~(ewreg & em2reg & (ern != 0) & (i_rs &(ern == rs)| i_rt & (ern == rt)));//0:STALL

	//00:pc+4 01:bpc 10:da 11:jpc
   assign pcsource[1] = i_jr | i_j | i_jal;
   assign pcsource[0] = ( i_beq & rsrtequ ) | (i_bne & ~rsrtequ) | i_j | i_jal ;
   
	//write register
   assign wreg = (i_add | i_sub | i_and | i_or   | i_xor  |
                 i_sll | i_srl | i_sra | i_addi | i_andi |
                 i_ori | i_xori | i_lw | i_lui  | i_jal) & wpcir;
	//write mem
	assign wmem    = i_sw & wpcir;

	// ALU related
   assign aluc[3] = i_sra;      // complete by yourself.
   assign aluc[2] = i_sub | i_or | i_srl | i_sra | i_ori | i_lui; 
   assign aluc[1] = i_xor | i_sll | i_srl | i_sra | i_xori | i_lui;
   assign aluc[0] = i_and | i_or | i_sll | i_srl | i_sra | i_andi | i_ori;
   assign shift   = i_sll | i_srl | i_sra ;

   assign aluimm  = i_addi | i_andi | i_ori | i_xori | i_lw | i_sw | i_lui;      // complete by yourself.
   // sign extend
	assign sext    = i_addi | i_lw | i_sw | i_beq | i_bne;
	
	//mem out to rn
   assign m2reg   = i_lw;
	//1: rt as rn 0: rd as rn 
   assign regrt   = i_addi | i_andi | i_ori | i_xori | i_lw  | i_lui;
	// return adrress register as rn and adrress as mem out 
   assign jal     = i_jal;

	always @ (ewreg or mwreg or ern or mrn or em2reg or mm2reg or rs or rt )
		begin
		//rd
		fwda =2'b00;
		if (ewreg & (ern != 0 ) & (ern == rs) & ~em2reg)	//alu need the result of prev-inst rd = rs
			begin
			fwda = 2'b01;
			end 
		else 
			begin
			if (mwreg & (mrn != 0 ) & (mrn == rs) & ~mm2reg)//alu need the result of the second inst before it   rd = rs
				begin
				fwda = 2'b10;
				end 
			else 
				begin
				if (mwreg & (mrn != 0) & (mrn == rs) & mm2reg)//alu need the memery output of the second inst before it   rd = rs
					begin
					fwda = 2'b11;
					end
				end
			end
		//rt
		fwdb = 2'b00;
		if (ewreg & (ern !=0 ) & (ern == rt) & ~em2reg)
			begin
			fwdb = 2'b01;
			end 
		else 
			begin
			if (mwreg & (mrn != 0) & (mrn == rt) & ~mm2reg)
				begin
				fwdb = 2'b10 ;
				end 
			else 
				begin
				if (mwreg & (mrn != 0 ) & (mrn == rt) & mm2reg )
					begin
					fwdb =2'b11;
					end
				end
			end
		end
  
endmodule