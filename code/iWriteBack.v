`include "definitions.vh"

module iWriteBack(
    input MemToReg,
    input [`WORD-1:0] ALU_result,
    input [`WORD-1:0] Mem_result,
    output [`WORD-1:0] result
    );
    
mux#(`WORD) wbmux(
    .Ain(),
    .Bin(),
    .control(),
    .mux_out()
    );
endmodule
