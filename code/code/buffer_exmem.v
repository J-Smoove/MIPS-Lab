`include "definitions.vh"

module buffer_exmem(
    input clk, 
    input reset,
    input [`WORD-1:0] Branch_Target_in,
    input [`WORD-1:0] Result_in,
    input [`WORD-1:0] MemWriteData_in,
    input [4:0] RegDstAddress_in,
    input zero_in,
    input Branch_in, 
    input MemRead_in, 
    input MemWrite_in, 
    input MemtoReg_in, 
    input RegWrite_in,
    output reg [`WORD-1:0] Branch_Target_out,
    output reg [`WORD-1:0] Result_out,
    output reg [`WORD-1:0] MemWriteData_out,
    output reg [4:0] RegDstAddress_out,
    output reg zero_out,
    output reg Branch_out, 
    output reg MemRead_out, 
    output reg MemWrite_out, 
    output reg MemtoReg_out, 
    output reg RegWrite_out
);

always@(negedge(clk),posedge(reset))
begin
    if (reset)
      begin
        Branch_Target_out<=`WORD'b0;
        Result_out<=`WORD'b0;
        MemWriteData_out<=`WORD'b0;
        RegDstAddress_out<=5'b0;
        zero_out<=1'b0;
        Branch_out<=1'b0; 
        MemRead_out<=1'b0;
        MemWrite_out<=1'b0;
        MemtoReg_out<=1'b0;
        RegWrite_out<=1'b0;
      end
    else
      begin  
        Branch_Target_out<=Branch_Target_in;
        Result_out<=Result_in;
        MemWriteData_out<=MemWriteData_in;
        RegDstAddress_out<=RegDstAddress_in;
        zero_out<=zero_in;
        Branch_out<=Branch_in; 
        MemRead_out<=MemRead_in;
        MemWrite_out<=MemWrite_in;
        MemtoReg_out<=MemtoReg_in;
        RegWrite_out<=RegWrite_in;
      end
end

endmodule
