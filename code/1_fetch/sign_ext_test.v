`timescale 1ns / 1ps
`include "definitions.vh"

module sign_ext_test;
 wire clk;
 reg [(`WORD/2)-1:0] in;
 wire [`WORD-1:0] out;
 oscillator clock(clk);
 
 sign_extender uut ( .in(in),
                     .out(out));
    initial begin
    
    in = 16'h1FFF;
    #50;
    in = 16'h9A23;
    #50;
    in = 16'h0023;
    #50;
    in = 16'h8001;
    #50;
    in = 16'hB2F1;
    #50;
    
    end
endmodule
