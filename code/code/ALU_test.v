`timescale 1ns / 1ps
`include "definitions.vh"

module ALU_test;
   
reg [`WORD-1:0] A;
reg [`WORD-1:0] B;
reg [3:0] ALU_control;
wire [`WORD-1:0] ALUresult;
wire zero;
 
 oscillator clock(clk);
 
ALU uut (.A(A),
         .B(B),
         .ALU_control(ALU_control),
         .ALUresult(ALUresult),
         .zero(zero)
                 );
    initial begin
  A = 4'h0005;
  B = 4'h0001;
  ALU_control = `ALU_ADD;
  #`CYCLE;
  ALU_control = `ALU_SUB;
  #`CYCLE;
  ALU_control = `ALU_AND;
  #`CYCLE;
  ALU_control = `ALU_OR;
  #`CYCLE;
  ALU_control = `ALU_NOR;
  #`CYCLE;
  ALU_control = `ALU_SLT;
  #`CYCLE;
  A = 4'h1111;
  ALU_control = `ALU_SUB;
    
    end
endmodule