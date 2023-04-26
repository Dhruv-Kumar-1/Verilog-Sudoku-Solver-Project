`timescale 1ns / 1ps
module t_naked_pairs;
  reg clk;
  reg reset;
  reg next;
  wire [3:0] D1,D2,D3;
  wire alldone;
  wire [323:0] A1;
  Naked_pairs n1(clk,reset,next,D1,D2,D3,alldone,A1);
  initial begin
    clk=1'b0;
  end
  initial begin
    next=1'b0;
  end
  initial 
    begin
      #2500000 next=1'b1;
      #200 next=1'b0;
      #200 next=1'b1;
      #200 next=1'b0;
      #200 next=1'b1;
      #200 next=1'b0;
      #200 next=1'b1;
      #200 next=1'b0;
      #200 next=1'b1;
      #200 next=1'b0;
      #200 next=1'b1;
      #200 next=1'b0;
      #200 next=1'b1;
      #200 next=1'b0;
      #200 next=1'b1;
      #200 next=1'b0;
      #200 next=1'b1;
      #200 next=1'b0;
      #200 next=1'b0;
      #200 next=1'b1;
      #200 next=1'b0;
      #200 next=1'b1;
      #200 next=1'b0;
      #200 next=1'b1;
      #200 next=1'b0;
      #200 next=1'b1;
      #200 next=1'b0;
      #200 next=1'b1;
      #200 next=1'b0;
      #200 next=1'b1;
      #200 next=1'b0;
      #200 next=1'b1;
      #200 next=1'b0;
      #200 next=1'b1;
      #200 next=1'b0;
      #200 next=1'b0;
      #200 next=1'b1;
      #200 next=1'b0;
      #200 next=1'b1;
      #200 next=1'b0;
      #200 next=1'b1;
      #200 next=1'b0;
      #200 next=1'b1;
      #200 next=1'b0;
      #200 next=1'b1;
      #200 next=1'b0;
      #200 next=1'b1;
      #200 next=1'b0;
      #200 next=1'b1;
      #200 next=1'b0;
      #200 next=1'b1;
      #200 next=1'b0;
      #200 next=1'b0;
      #200 next=1'b1;
      #200 next=1'b0;
      #200 next=1'b1;
      #200 next=1'b0;
      #200 next=1'b1;
      #200 next=1'b0;
      #200 next=1'b1;
      #200 next=1'b0;
      #200 next=1'b1;
      #200 next=1'b0;
      #200 next=1'b1;
      #200 next=1'b0;
      #200 next=1'b1;
      #200 next=1'b0;
      #200 next=1'b1;
      #200 next=1'b0;
      #200 next=1'b1;
      #200 next=1'b0;
      #200 next=1'b1;
      #200 next=1'b0;
      #200 next=1'b1;
      #200 next=1'b0;
      #200 next=1'b1;
      #200 next=1'b0;
    end
  initial
    begin
      forever #5 clk=~clk;
    end
  initial 
    begin
      reset=1'b0;
      #62 reset=1'b1;
      #9 reset=1'b0;
    end
  initial 
    begin
      $dumpfile("naked_pairs.vcd");
      $dumpvars(0,t_naked_pairs);
      $monitor($time," D1 = %d D2 = %d D3 = %d",D1,D2,D3);
    end
endmodule