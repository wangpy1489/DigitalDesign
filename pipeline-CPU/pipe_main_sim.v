module pipe_main_sim;
	reg 	resetn_sim;
	reg 	clock_sim;
	reg	sw9_sim,sw8_sim,sw7_sim,sw6_sim,sw5_sim,sw4_sim,sw3_sim,sw2_sim,sw1_sim,sw0_sim;
	wire [6:0] hex5_sim,hex4_sim,hex3_sim,hex2_sim,hex1_sim,hex0_sim;
	pipelined_computer pipelined_computer_main_inst
(
	.CLOCK_10(clock_sim) ,	// input  clock_sig
	.SW9(sw9_sim) ,	// input  SW9_sig
	.SW8(sw8_sim) ,	// input  SW8_sig
	.SW7(sw7_sim) ,	// input  SW7_sig
	.SW6(sw6_sim) ,	// input  SW6_sig
	.SW5(sw5_sim) ,	// input  SW5_sig
	.SW4(sw4_sim) ,	// input  SW4_sig
	.SW3(sw3_sim) ,	// input  SW3_sig
	.SW2(sw2_sim) ,	// input  SW2_sig
	.SW1(sw1_sim) ,	// input  SW1_sig
	.SW0(sw0_sim) ,	// input  SW0_sig
	.reset(resetn_sim) ,	// input  reset_sig
	.HEX5(hex5_sim) ,	// output [6:0] HEX5_sig
	.HEX4(hex4_sim) ,	// output [6:0] HEX4_sig
	.HEX3(hex3_sim) ,	// output [6:0] HEX3_sig
	.HEX2(hex2_sim) ,	// output [6:0] HEX2_sig
	.HEX1(hex1_sim) ,	// output [6:0] HEX1_sig
	.HEX0(hex0_sim) 	// output [6:0] HEX0_sig
);
	 initial
	  begin
			clock_sim = 1;
			while (1)
				 #1  clock_sim = ~clock_sim;
	  end

	  
		  
	 initial
        begin
            resetn_sim = 0;            // 低电平持续10个时间单位，后一直为1。
            while (1)
                #5 resetn_sim = 1;
        end
	 
	 initial
	     begin
		      sw9_sim=0;
				sw8_sim=0;
				sw7_sim=0;
				sw6_sim=0;
				sw5_sim=0;
				sw4_sim=0;
				sw3_sim=0;
				sw2_sim=0;
				sw1_sim=0;
				sw0_sim = 0;
				while(1)
                    #5 sw8_sim = 1;
						  
		  end
	 initial
		begin
			while(1)
				#5 sw3_sim = 1;
		end
	
	
endmodule