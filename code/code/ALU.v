`include "definitions.vh"



module ALU(
    input [`WORD-1:0] A,
    input [`WORD-1:0] B,
    input [3:0] ALU_control,
    output reg[`WORD-1:0] ALUresult,
    output zero
    );
    
    assign zero = (A==B) ; //fill in the blank :)
    
    always@(*) begin
    
    case (ALU_control)
    `ALU_ADD : ALUresult = A + B;
    `ALU_SUB : ALUresult = A - B;
    `ALU_AND : ALUresult = A & B;
    `ALU_OR  : ALUresult = A | B;
    `ALU_NOR : ALUresult = ~(A | B);
    `ALU_SLT : if (A < B)
                ALUresult = 4'h0001;
                else
                ALUresult = 4'h0000;
                
    endcase
    end
endmodule
