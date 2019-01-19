module dff32 (d,clk,clrn,q);
   input  [31:0] d;
   input         clk,clrn;
   output [31:0] q;
   reg 	[31:0]    q;
   always @ (negedge clrn or posedge clk)
      if (clrn == 0) begin

          q <=0;
      end else begin
          q <= d;
      end
endmodule

module dff1 (d,clk,clrn,q);
   input   d;
   input   clk,clrn;
   output  q;
   reg 	  q;
   always @ (negedge clrn or posedge clk)
      if (clrn == 0) begin

          q <=0;
         
      end else begin
          q <= d;
      end
endmodule

module dff4 (d,clk,clrn,q);
   input  [3:0] d;
   input         clk,clrn;
   output [3:0] q;
   reg 	[3:0]    q;
   always @ (negedge clrn or posedge clk)
      if (clrn == 0) begin

          q <=0;

      end else begin
          q <= d;
      end
endmodule

module dff5 (d,clk,clrn,q);
   input  [4:0] d;
   input         clk,clrn;
   output [4:0] q;
   reg 	[4:0]    q;
   always @ (negedge clrn or posedge clk)
      if (clrn == 0) begin

          q <=0;

      end else begin
          q <= d;
      end
endmodule