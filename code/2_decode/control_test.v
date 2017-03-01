`timescale 1ns / 1ps
`include "definitions.vh"

module control_test;
 wire clk;
 
 reg [5:0] Opcode;
     wire RegDst;
     wire  Branch;
     wire  MemRead;
     wire  MemtoReg;
     wire  [1:0] ALUOp;
     wire  MemWrite;
     wire  ALUSrc;
     wire  RegWrite;
 
 oscillator clock(clk);
 
 control uut ( .Opcode(Opcode),
               .RegDst(RegDst),
               .Branch(Branch),
               .MemRead(MemRead),
               .ALUOp(ALUOp),
               .MemWrite(MemWrite),
               .ALUSrc(ALUSrc),
               .RegWrite(RegWrite),
               .MemtoReg(MemtoReg)
              );
    initial begin
    
    Opcode = (`RTYPE);
    #50;
    Opcode = (`LW);
    #50;
    Opcode = (`SW);
    #50;
    Opcode = (`BEQ);
    #50;
    Opcode = 6'b110110;
   
    
    
    end
endmodule