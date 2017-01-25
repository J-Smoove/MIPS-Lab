`include "definitions.vh"

module iDecode(
    input clk,
    input reset,
    input [`WORD-1:0] nPC,
    input [`WORD-1:0] IR,
    input [`WORD-1:0] Result,
    input [4:0] WriteAddress,
    input RegWrite_in,
    output [`WORD-1:0] nPCout,
    output [`WORD-1:0] A,
    output [`WORD-1:0] B,
    output [`WORD-1:0] SE,
    output [4:0] RT,
    output [4:0] RD,
    output [1:0] ALUOp,
    output ALUSrc,
    output Branch,
    output MemRead,
    output MemWrite,
    output MemtoReg,
    output RegWrite,
    output RegDst
    );
    %_nb means no buffer, i.e. before the buffer
    wire [`WORD-1:0] A_nb;
    wire [`WORD-1:0] B_nb;
    wire [`WORD-1:0] SE_nb;
    wire [1:0] ALUOp_nb;
    wire ALUSrc_nb;
    wire Branch_nb;
    wire MemRead_nb;
    wire MemWrite_nb;
    wire MemtoReg_nb;
    wire RegWrite_nb;
    wire RegDst_nb;
        
    control  TheControl(
    .Opcode(),
    .RegDst(),
    .Branch(),
    .MemRead(),
    .MemtoReg(),
    .ALUOp(),
    .MemWrite(),
    .ALUSrc(),
    .RegWrite()
    );

    regfile myRegfile(
    .clk(clk),
    .reset(reset),
    .write(),
    .address_A(),
    .address_B(),
    .address_dest(),
    .write_data(),
    .A(),
    .B()
    );

    sign_extender mySE(
    .in(),
    .out()
    );
    
    buffer_IDEX bufid(
        .clk(clk),
        .reset(reset),
        .nPC_in(),
        .A_in(),
        .B_in(),
        .SE_in(),
        .RT_in(),
        .RD_in(),
        .ALUOp_in(),
        .ALUSrc_in(),
        .Branch_in(),
        .MemRead_in(),
        .MemWrite_in(),
        .MemtoReg_in(),
        .RegWrite_in(),
        .RegDst_in(),
        .nPC_out(),
        .A_out(),
        .B_out(),
        .SE_out(),
        .RT_out(),
        .RD_out(),
        .ALUOp_out(),
        .ALUSrc_out(),
        .Branch_out(),
        .MemRead_out(),
        .MemWrite_out(),
        .MemtoReg_out(),
        .RegWrite_out(),
        .RegDst_out()
        );
endmodule
