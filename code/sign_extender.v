`include "definitions.vh"

module sign_extender(
    input [(`WORD/2)-1:0] in,
    output [`WORD-1:0] out
    );
    assign out = {{(n){in[(index)]}} , in };
endmodule
