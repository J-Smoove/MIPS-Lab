`include "definitions.vh"

module buffer_IDEX (
    input clk,
    input reset,
    input [`WORD-1:0] nPC_in,
    input [`WORD-1:0] A_in,
    input [`WORD-1:0] B_in,
    input [`WORD-1:0] SE_in,
    input [4:0] RT_in,
    input [4:0] RD_in,
    input [1:0] ALUOp_in,
    input ALUSrc_in,
    input Branch_in,
    input MemRead_in,
    input MemWrite_in,
    input MemtoReg_in,
    input RegWrite_in,
    input RegDst_in,
    output reg [`WORD-1:0] nPC_out,
    output reg [`WORD-1:0] A_out,
    output reg [`WORD-1:0] B_out,
    output reg [`WORD-1:0] SE_out,
    output reg [4:0] RT_out,
    output reg [4:0] RD_out,
    output reg [1:0] ALUOp_out,
    output reg ALUSrc_out,
    output reg Branch_out,
    output reg MemRead_out,
    output reg MemWrite_out,
    output reg MemtoReg_out,
    output reg RegWrite_out,
    output reg RegDst_out
    );
    
    always@(negedge(clk),posedge(reset))
    begin
        if (reset)
          begin
            nPC_out<=`WORD'b0;
            A_out<=`WORD'b0;
            B_out<=`WORD'b0;
            SE_out<=`WORD'b0;
            RT_out<=5'b0;
            RD_out<=5'b0;
            ALUOp_out<=2'b0;
            ALUSrc_out<=1'b0;
            Branch_out<=1'b0;
            MemRead_out<=1'b0;
            MemWrite_out<=1'b0;
            MemtoReg_out<=1'b0;
            RegWrite_out<=1'b0;
            RegDst_out<=1'b0;
          end
        else
          begin  
              nPC_out<=nPC_in;
              A_out<=A_in;
              B_out<=B_in;
              SE_out<=SE_in;
              RT_out<=RT_in;
              RD_out<=RD_in;
              ALUOp_out<=ALUOp_in;
              ALUSrc_out<=ALUSrc_in;
              Branch_out<=Branch_in;
              MemRead_out<=MemRead_in;
              MemWrite_out<=MemWrite_in;
              MemtoReg_out<=MemtoReg_in;
              RegWrite_out<=RegWrite_in;
              RegDst_out<=RegDst_in;
          end
    end
    
    endmodule