`timescale 1ns / 1ps
`include "definitions.vh"

module regfile_testbench;
  integer i;
     parameter SIZE=32, bits=`CLOG2(SIZE);
    wire clk;
    reg reset;
    reg write;
    reg [(bits - 1):0] address_A;
    reg [(bits - 1):0] address_B;
    reg [(bits - 1):0] address_dest;
    reg [`WORD - 1:0] write_data;
    wire [`WORD - 1:0] A;
    wire [`WORD - 1:0] B;
    
 oscillator clock(clk);
 
 regfile uut (.clk(clk),
              .reset(reset),
              .write(write),
          .address_A(address_A),
          .address_B(address_B),
       .address_dest(address_dest),
         .write_data(write_data),
                  .A(A),
                  .B(B) 
              );
    initial begin
    
    //write test
  reset = 0;
 
    address_B = 21;
  address_A = 24;
  
  write = 0;
  for(i=0;i<SIZE;i=i+1) begin
  
    
  if(i < 20) begin
  write = 1;
  end
  if(i >= 20) begin
  write = 0;
  end
    
    address_dest = i; 
    write_data = i+10;
    
  # (`CYCLE);   
  end
  
  
  // read test
  


    
    
    end
endmodule