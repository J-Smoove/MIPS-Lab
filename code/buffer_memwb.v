`include "definitions.vh"

module buffer_memwb(
    input clk, 
    input reset,
    input [4:0] RegDstAddress_in,
    input [`WORD-1:0] MemReadData_in,
    input [`WORD-1:0] ALUResult_in,
    input MemtoReg_in, 
    input RegWrite_in,
    output reg [4:0] RegDstAddress_out,
    output reg [`WORD-1:0] MemReadData_out,
    output reg [`WORD-1:0] ALUResult_out,
    output reg MemtoReg_out, 
    output reg RegWrite_out
);

always@(negedge(clk),posedge(reset))
begin
    if (reset)
      begin
          RegDstAddress_out<=`WORD'b0;
          MemReadData_out<=`WORD'b0;
          ALUResult_out<=`WORD'b0;
          MemtoReg_out<=`WORD'b0; 
          RegWrite_out<=`WORD'b0;
      end
    else
      begin  
         RegDstAddress_out<=RegDstAddress_in;
         MemReadData_out<=MemReadData_in;
         ALUResult_out<=ALUResult_in;
         MemtoReg_out<=MemtoReg_in; 
         RegWrite_out<=RegWrite_in;
      end
end

endmodule
