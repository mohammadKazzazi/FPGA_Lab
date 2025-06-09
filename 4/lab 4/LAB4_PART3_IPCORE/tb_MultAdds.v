`timescale 1ns / 1ps
module tb_MultAdds();

	reg clk;
	reg reset;
	reg [15:0] a1 = 16'b0000000000000001; 
	reg [15:0] b1 = 16'b0000000000000011;
	
	reg [15:0] a2 = 16'b0000000000000010; 
	reg [15:0] b2 = 16'b0000000000010000;
	
	reg [15:0] a3 = 16'b0000000000000011; 
	reg [15:0] b3 = 16'b0000001000000000;
	
	wire [32:0] p1;
	wire [47:0] pcout1;
	
	wire [33:0] p2;
	wire [47:0] pcout2;
	
	wire [34:0] p3;
	wire [47:0] pcout3;
	
	
    // Clock generation
    always #10 clk = ~clk; // 20 ns period (toggle every 10 ns)

    // Simulation duration
    initial begin
			clk = 0;
			reset = 1;
			#1000; // Simulate for 1000 ns
    end

	MultAdd1 my_MultAdd1 (
	  .clk(clk), 								// input clk
	  .ce(1'b1), 								// input clock enable 	 (set to 1 all the time)
	  .sclr(1'b0), 							// input sclr 				 (synchronous clear active HIGH)
	  .a(16'b1), 									// input [15 : 0] a
	  .b(16'b1), 									// input [15 : 0] b
	  .c(2'b00), 								// input [1 : 0] c
	  .subtract(1'b0), 						// input subtract 		 (set to 1 all the time to apply summation) 
	  .p(p1), 									// output [32 : 0] p
	  .pcout(pcout1) 							// output [47 : 0] pcout
	);
	
	MultAdd2 my_MultAdd2 (
	  .clk(clk), 								// input clk
	  .ce(1'b1), 								// input ce              (set to 1 all the time)
	  .sclr(~reset), 							// input sclr            (synchronous clear active HIGH)
	  .a(a2), 									// input [15 : 0] a
	  .b(b2), 									// input [15 : 0] b
	  .c(p1), 									// input [47 : 0] c
	  .pcin(pcout1), 							// input [47 : 0] pcin
	  .subtract(1'b0), 						// input subtract        (set to 1 all the time to apply summation) 
	  .p(p2), 									// output [33 : 0] p
	  .pcout(pcout2) 							// output [47 : 0] pcout
	);
	
	MultAdd3 my_MultAdd3(
	  .clk(clk), 								// input clk
	  .ce(1'b1), 								// input ce              (set to 1 all the time)
	  .sclr(~reset), 							// input sclr            (synchronous clear active HIGH)
	  .a(a3), 									// input [15 : 0] a
	  .b(b3), 									// input [15 : 0] b
	  .c(p2), 									// input [47 : 0] c
	  .pcin(pcout2), 							// input [47 : 0] pcin
	  .subtract(1'b0), 						// input subtract        (set to 1 all the time to apply summation) 
	  .p(p3), 									// output [34 : 0] p
	  .pcout(pcout3) 							// output [47 : 0] pcout
	);

endmodule
