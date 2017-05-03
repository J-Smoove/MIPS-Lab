`include "definitions.vh"

module pipeline;

// size of data and instruction memory
parameter MEMSIZE=1024;

//special
wire clk,clk_a;
reg reset,run;

// wires from Fetch outputs

    
    wire [`WORD-1:0] nPC;
    wire [`WORD-1:0] IR;


// wires from decode outputs

    wire [`WORD-1:0] nPCout;
    wire [`WORD-1:0] A;
    wire [`WORD-1:0] B;
    wire [`WORD-1:0] SE;
    wire [4:0] RT;
    wire [4:0] RD;
    wire [1:0] ALUOp;
    wire ALUSrc;
    wire Branch;
    wire MemRead;
    wire MemWrite;
    wire MemtoReg;
    wire RegWrite;
    wire RegDst;


// wires from Execute outputs

    wire [`WORD-1:0] Branch_Target;
    wire [`WORD-1:0] ALUResult_in;
    wire [`WORD-1:0] MemWriteData;
    wire [4:0] RegDstAddress_in;
    wire zero;
    wire Branch_out;
    wire MemRead_out;
    wire MemWrite_out;
    wire RegWrite_out;
    wire MemtoReg_out;


// wires from Memory outputs

  
   wire PCSrc;
   wire [4:0] RegDstAddress_out;
   wire [`WORD-1:0] MemReadData;
   wire [`WORD-1:0] ALUResult_out;
   wire RegWrite_in;
   wire MemtoReg_end;


// wires from Write Back outputs

    wire [`WORD-1:0] result;



// clock generator
oscillator  Crystal(
    .clk(clk)
    );

// does run control and slips - use clk_a not clk
assign clk_a = clk & run;

// Fetch// Fetch// Fetch// Fetch// Fetch// Fetch// Fetch// Fetch// Fetch// Fetch// Fetch// Fetch// Fetch// Fetch// Fetch// Fetch
iFetch F(
.clk(clk_a),
.reset(reset),
.PCSrc(PCSrc),
.BrDest(Branch_Target),
.nPC(nPC),
.IR(IR)
);

// Decode// Decode// Decode// Decode// Decode// Decode// Decode// Decode// Decode// Decode// Decode// Decode// Decode// Decode// Decode
iDecode D(
.clk(clk_a),
.reset(reset),
.nPC(nPC),
.IR(IR),
.Result(result),                    
.WriteAddress(RegDstAddress_out),        
.RegWrite_in(RegWrite_in),          
.nPCout(nPCout),                    
.A(A),
.B(B),
.SE(SE),
.RT(RT),
.RD(RD),
.ALUOp(ALUOp),
.ALUSrc(ALUSrc),
.Branch(Branch),
.MemRead(MemRead),
.MemWrite(MemWrite),
.MemtoReg(MemtoReg),            
.RegWrite(RegWrite),
.RegDst(RegDst)
);    
    
// Execute// Execute// Execute// Execute// Execute// Execute// Execute// Execute// Execute// Execute// Execute// Execute// Execute// Execute
iExecute E(
.clk(clk_a),
.reset(reset),
.n_PCin(nPCout),
.A(A),
.B(B),
.SE(SE),
.RT(RT),
.RD(RD),
.ALUOp(ALUOp),
.ALUSrc(ALUSrc),
.RegDst(RegDst),
.Branch_in(Branch),     
.MemRead_in(MemRead),
.MemWrite_in(MemWrite),
.RegWrite_in(RegWrite),
.MemtoReg_in(MemtoReg),
.Branch_Target(Branch_Target),
.Result(ALUResult_in),
.MemWriteData(MemWriteData),
.RegDstAddress(RegDstAddress_in),
.zero(zero),
.Branch_out(Branch_out),
.MemRead_out(MemRead_out),
.MemWrite_out(MemWrite_out),
.RegWrite_out(RegWrite_out),
.MemtoReg_out(MemtoReg_out)
 );   
    
// Memory// Memory// Memory// Memory// Memory// Memory// Memory// Memory// Memory// Memory// Memory// Memory// Memory// Memory// Memory// Memory// Memory
iMemory M(
.clk(clk_a),
.reset(reset),
.zero(zero),
.Branch(Branch_out),
.MemRead(MemRead_out),
.MemWrite(MemWrite_out),
.RegWrite_in(RegWrite_out),
.MemtoReg_in(MemtoReg_out),
.RegDstAddress_in(RegDstAddress_in),
.ALUResult_in(ALUResult_in),
.MemWriteData(MemWriteData),
.RegWrite_out(RegWrite_in),
.MemtoReg_out(MemtoReg_end),
.PCSrc(PCSrc),
.RegDstAddress_out(RegDstAddress_out),
.MemReadData(MemReadData),
.ALUResult_out(ALUResult_out)
);   

// Write Back// Write Back// Write Back// Write Back// Write Back// Write Back// Write Back// Write Back// Write Back// Write Back// Write Back// Write Back
iWriteBack WB(
.MemToReg(MemtoReg_end),
.ALU_result(ALUResult_out),
.Mem_result(MemReadData),
.result(result)
);
    
// sends a reset pulse at the start and puts in run mode
// must be last so runs first (Verilog uses a stack to simulate)
initial begin
    reset<=1;
    run<=0;
    #(2*`CYCLE/3) reset<=0;
    run<=1;
end
endmodule