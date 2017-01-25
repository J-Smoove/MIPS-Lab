`timescale 1ns / 1ps

module mux_test;

	reg [15:0] Ain;
	reg [15:0] Bin;
	reg control;
	wire [15:0] mux_out;

	mux#(16) uut (
		.Ain(Ain), 
		.Bin(Bin), 
		.control(control), 
		.mux_out(mux_out)
	);

	initial begin
			
		Ain <= 0;
		Bin <= 12;
		control <= 1;
        #10;
        Ain <= 23;
                Bin <= 12;
                control <= 1;
                #10;
                Ain <= 0;
                        Bin <= 1222;
                        control <= 1;
                        #10;
                        Ain <= 0234;
                                Bin <= 312;
                                control <= 0;
                                #10;
                                Ain <= 1231;
                                        Bin <= 12;
                                        control <= 1;
                                        #10;
                                        Ain <= 0;
                                                Bin <= 102;
                                                control <= 0;
                                                #10;

	end
      
endmodule

