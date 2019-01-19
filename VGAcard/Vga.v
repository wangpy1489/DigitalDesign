module vga640x480 (
	 input clk,
	 output reg vga_clk,
    input reset,
    output vga_h_sync,
    output vga_v_sync,
    output inDisplayArea,
    output  reg[9:0] col_i,
    output  reg[9:0] row_i
);
	 reg [9:0] CounterX;
	 reg [9:0] CounterY;
	 
    always @ (posedge vga_clk or negedge reset) begin
        if (!reset) begin
            CounterX <= 10'h0;
        end else if (CounterX == 10'd799) begin
            CounterX <= 10'h0;
        end else begin
            CounterX <= CounterX + 10'h1;
        end
    end

    always @ (posedge vga_clk or negedge reset) begin
        if (!reset) begin
            CounterY <= 10'h0;
        end else if (CounterX == 10'd799) begin
            if (CounterY == 10'd524) begin
                CounterY <= 10'h0;
            end else begin
                CounterY <= CounterY + 10'h1;
            end
        end
    end

	always @(posedge clk or negedge reset)
	begin
		 if(!reset)
			  vga_clk   <=  1'b0        ;
		 else
			  vga_clk   <=  ~vga_clk  ;     
	end
 /*   always @ (posedge vga_clk or negedge clrn) begin
        if (clrn == 0) begin
            video_out <= 1'b0;
        end else begin
            video_out <= ~rdn;
        end
    end
*/

    assign inDisplayArea =((CounterX >= 10'd143) && (CounterX < 10'd783)) &&
                ((CounterY >= 10'd35)  && (CounterY < 10'd515));

    assign vga_h_sync = CounterX >= 10'd96;
    assign vga_v_sync = CounterY >= 10'd2;
	 
	 always @(vga_clk)begin
		if	(inDisplayArea)begin
			col_i <= CounterX -10'd143;
			row_i = CounterY - 10'd35;
		end
		else begin
			col_i<=0;
			row_i<=0;
		end
	 end
endmodule
