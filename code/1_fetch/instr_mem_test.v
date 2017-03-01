`timescale 1ns / 1ps
`include "definitions.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/01/2017 03:57:51 PM
// Design Name: 
// Module Name: instr_mem_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

    
   

module instr_mem_test;

wire clk;
reg [`WORD - 1:0] pc;
wire [`WORD - 1:0] instruction; 

oscillator clock(clk);
instr_mem uut ( .clk(clk),
                .pc(pc),
                .instruction(instruction));

initial

begin


pc = 3;
#50;
pc = 8;
#50;
pc = 25;
#50;
pc = 13;
#50;
pc = 18;
end


endmodule
