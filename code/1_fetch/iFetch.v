`include "definitions.vh"

module iFetch#(parameter STEP=32'd1, SIZE=1024)(
    input clk,
    input reset,
    input PCSrc,
    input [`WORD-1:0] BrDest,
    output [`WORD-1:0] nPC,
    output [`WORD-1:0] IR
    );
    wire [`WORD-1:0] PC;
    wire [`WORD-1:0] new_PC;
    wire[`WORD-1:0] nextPC;
    wire[`WORD-1:0] IRnb;
    
  
    
    mux#(`WORD) PCsel(
    .Ain(nextPC),
    .Bin(BrDest),
    .control(PCSrc),
    .mux_out(new_PC)
    );
        
    register myPC(
    .clk(clk),
    .reset(reset),
    .D(new_PC),
    .Q(PC)
    );
    
    adder incrementer(
    .Ain(PC),
    .Bin(4),
    .add_out(nextPC)
    );
    
    instr_mem#(SIZE) iMemory(
    .clk(clk),
    .pc(PC),
    .instruction(IRnb)
    );
    
    buffer_ifid fetchBuffer(
    .clk(clk),
    .reset(reset),
    .nPC_if(nextPC),
    .IR_if(IRnb),
    .nPC_id(nPC),
    .IR_id(IR)
    
    );
endmodule
