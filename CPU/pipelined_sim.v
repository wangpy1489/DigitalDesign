`timescale 1ps/1ps

module pipe_computer_sim;
	
	reg 	resetn_sim;
	reg 	clock_sim;
	reg 	mem_clock_sim;
	reg    [31:0] in_port0_sim;
	reg    [31:0] in_port1_sim;
	
	wire   [31:0]  pc_sim,inst_sim,ealu_sim,malu_sim,walu_sim,memout_sim;
	wire           imem_clk_sim,dmem_clk_sim;
	wire   [31:0]  out_port0_sim,out_port1_sim,out_port2_sim;
	wire   [31:0]  mem_dataout_sim;
	wire   [31:0]  io_read_data_sim;
	
	pipelined_computer pipelined_computer_instance(resetn_sim,clock_sim,mem_clock_sim, pc_sim,inst_sim,ealu_sim,malu_sim,walu_sim,
								out_port0_sim,out_port1_sim,out_port2_sim,in_port0_sim,in_port1_sim,mem_dataout_sim,io_read_data_sim);
	 initial
		  begin
				clock_sim = 1;
				while (1)
					 #1  clock_sim = ~clock_sim;
		  end

	   
	 initial
        begin
            mem_clk_sim = 0;
            while (1)
                #1  mem_clk_sim = ~ mem_clk_sim;
        end

	   	  
		  
		  
	 initial
        begin
            resetn_sim = 0;            // 低电平持续10个时间单位，后一直为1。
            while (1)
                #5 resetn_sim = 1;
        end
	 
	 initial
	     begin
		      in_port0_sim = 0;
				while(1)
                    #5 in_port0_sim = in_port0_sim+1;
		  end
	 
	 initial
	     begin
		      in_port1_sim = 1;
				while(1)
                    #5 in_port1_sim = in_port1_sim+1;
		  end

