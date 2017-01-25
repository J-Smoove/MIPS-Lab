`include "definitions.vh"

module control(
    input [5:0] Opcode,
    output reg  RegDst,
    output reg  Branch,
    output reg  MemRead,
    output reg  MemtoReg,
    output reg  [1:0] ALUOp,
    output reg  MemWrite,
    output reg  ALUSrc,
    output reg  RegWrite
    );
    always@(*) begin
        case (Opcode)
        `RTYPE: begin
                RegDst<=;
                Branch<=;
                MemRead<=;
                MemtoReg<=;
                ALUOp<=`ALUOp_R;
                MemWrite<=;
                ALUSrc<=;
                RegWrite<=;
            end
        `LW: begin
                RegDst<=;
                Branch<=;
                MemRead<=;
                MemtoReg<=;
                ALUOp<=;
                MemWrite<=;
                ALUSrc<=;
                RegWrite<=;
            end
        `SW: begin
                RegDst<=;
                Branch<=;
                MemRead<=;
                MemtoReg<=;
                ALUOp<=;
                MemWrite<=;
                ALUSrc<=;
                RegWrite<=;
            end
        `BEQ: begin
                RegDst<=;
                Branch<=;
                MemRead<=;
                MemtoReg<=;
                ALUOp<=;
                MemWrite<=;
                ALUSrc<=;
                RegWrite<=;
            end
        default: begin
                RegDst<=;
                Branch<=;
                MemRead<=;
                MemtoReg<=;
                ALUOp<=;
                MemWrite<=;
                ALUSrc<=;
                RegWrite<=;
            end
        endcase
    end
endmodule
