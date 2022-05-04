`timescale 1ns/1ps
module BCD_tb;
  reg clk;
  reg rst;
  reg load;
  reg [3:0] data;
  wire [3:0] Q1;
  wire [7:0] disp;

  parameter PERIOD = 20;
  parameter real DUTY_CYCLE = 0.5;
  parameter OFFSET = 0;

  initial
    begin
      #OFFSET;
      forever
        begin
          clk = 1'b0;
          #(PERIOD-(PERIOD*DUTY_CYCLE)) clk = 1'b1;
          #(PERIOD*DUTY_CYCLE);
      	end
      end
      initial begin
        rst = 1'b0;
        load=1'b0;
        data=4'b0101;
        #20 rst= 1'b1;
        #200 load= 1'b1;
        #201 load= 1'b0;
        #1000 $finish;
      end
      initial begin
      $dumpfile("BCD.vcd");
      $dumpvars(0, BCD_tb);
    end

  BCD BCD_tb (.clk(clk),.rst(rst),.load(load),.data(data),.Q1(Q1),.disp(disp));
endmodule