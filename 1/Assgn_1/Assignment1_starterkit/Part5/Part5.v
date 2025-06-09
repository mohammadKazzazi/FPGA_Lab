// a sequence detector FSM using one-hot encoding. 
// SW0 is the active low synchronous reset, SW1 is the w input, and KEY0 is the clock.
// The z output appears on LEDG0, and the state FFs appear on LEDR8..0
module Part5 (SW, KEY, LEDG, LEDR);
	input [1:0] SW;
	input [0:0] KEY;
	output [0:0] LEDG;
	output [8:0] LEDR;

	wire Clock, Resetn, w, z;

	assign Clock = KEY[0];
	assign Resetn = SW[0];
	assign w = SW[1];


	/* Your code goes here */

	assign z = ...;
	assign LEDR[8:0] = ...;
	assign LEDG[0] = ...;
endmodule
