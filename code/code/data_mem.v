`include "definitions.vh"

module data_mem#(
    parameter SIZE=1024)(
    input clk,
    input reset,
    input write,
    input read,
    input [`WORD - 1:0] address,
    input [`WORD - 1:0] write_data,
    output reg [`WORD - 1:0] read_data=`WORD'bz
    );
    localparam HIGH_IMPEDIANCE=32'bz;
    reg[`WORD - 1:0] dmem [SIZE-1:0];
    integer i;
    
    
    always@(*) begin
    if(write) 
    begin
        dmem[address] <= write_data;
        read_data <= HIGH_IMPEDIANCE;
    end
    
    if(read) 
    begin
        read_data <= write_data;
    end
    
    
    
    //handle output
    end
    //initialize memory from file
    initial
        $readmemh(`DMEMFILE, dmem);

endmodule
