module pipeif ( pcsource,pc,bpc,da,jpc,npc,pc4,ins,mem_clock ); 
	input mem_clock;
	input [1:0] pcsource;
	input [31:0] pc,bpc,da,jpc;
	output [31:0] npc,pc4,ins;

	cla32 pc_plus4(pc,32'h4,32'h0,pc4);
	mux4x32 next_pc_switch(pc4,bpc,da,jpc,pcsource,npc);
	sc_instmem inst_mem (pc,ins,mem_clock);
endmodule