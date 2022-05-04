module BCD(clk,rst,load,data,Q1,disp);
input clk;
input rst;
input load;
input [3:0] data;
output [3:0] Q1;
output [7:0] disp;
reg [3:0] Q1;
reg [7:0] disp;

always@(posedge clk)
begin
   if(!rst)
      Q1<=0;
   else if(Q1==9)
      Q1<=0;
   else if(load)
      Q1<=data;
   else 
      Q1<=Q1+1;
end

always@(Q1)
   case(Q1)
      4'b0000:disp=8'b11000000;
      4'b0001:disp=8'b11111001;
      4'b0010:disp=8'b10100100;
      4'b0011:disp=8'b10110000;
      4'b0100:disp=8'b10011001;
      4'b0101:disp=8'b10010010;
      4'b0110:disp=8'b10000010;
      4'b0111:disp=8'b11111000;
      4'b1000:disp=8'b10000000;
      4'b1001:disp=8'b10010000;
   endcase
endmodule

module dff_1 (clk, D, Din, Load, Q4);
   input clk, D, Din, Load;
   output Q4;
   reg Q4;
   always@ (posedge clk) 
   if (Load) Q4 = Din;
   else Q4 = D;
endmodule