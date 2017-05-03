`timescale 1ns / 1ps
`include "definitions.vh"

module ALU_control_test;
   
reg [1:0] ALUOp;
reg [5:0] funct;
wire  [3:0] ALU_control;
 
 oscillator clock(clk);
 
ALU_control uut (.ALUOp(ALUOp),
                 .funct(funct),
                 .ALU_control(ALU_control)
                 );
    initial begin
   
    ALUOp = `ALUOp_ADD;
    funct = `F_AND;
    #`CYCLE;
    
    ALUOp = `ALUOp_SUB;
    funct = `F_NOR;
    #`CYCLE;
    
    ALUOp = `ALUOp_R;
    funct = `F_AND;
    #`CYCLE;
    
    ALUOp = `ALUOp_R;
    funct = `F_SLT;
    #`CYCLE;
    
    ALUOp = 2'b11;
    funct = `F_SLT;
    #`CYCLE;  
    
    ALUOp = `ALUOp_R;
    funct = `F_NOR;
    #`CYCLE;
      
    
    end
endmodule