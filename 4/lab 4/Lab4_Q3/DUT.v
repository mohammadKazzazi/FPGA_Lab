`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:21:53 07/03/2024 
// Design Name: 
// Module Name:    DUT 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module DUT(
    input Clk,
    input Reset,
    input [1:0] Control,
    input [15:0] Input1,
    input [15:0] Input2,
    output reg [37:0] Output1
    );
	 
	 parameter state0 = 2'b00, state1 = 2'b01, state2 = 2'b10, state3 = 2'b11;
	 integer i, j;
	 
	 reg [1:0] counter;
	 reg [32:0] cordic_in;
	 reg [15:0] InputMultiplier1, InputMultiplier2;
	 reg [15:0] Multiplier1_Input1, Multiplier1_Input2, Multiplier2_Input1, Multiplier2_Input2, Multiplier3_Input1, Multiplier3_Input2;
	 reg [15:0] multAdd1_in1, multAdd1_in2, multAdd2_in1, multAdd2_in2, multAdd3_in1, multAdd3_in2;
	 reg [15:0] temp_mem1 [8:0];
	 reg [15:0] temp_mem2 [8:0];
	 
	 wire [16:0] cordic_out;
	 wire [33:0] MultiplicationResult, MultiplicationResult1, MultiplicationResult2, MultiplicationResult3;
	 wire [32:0] multAdd1_p;
	 wire [33:0] multAdd2_p;
	 wire [34:0] multAdd3_p;
	 wire [47:0] multAdd1_pcout, multAdd2_pcout, multAdd3_pcout;
	 wire [18:0] realPart, imgPart;
	 
	 assign realPart = MultiplicationResult1[33:17] + MultiplicationResult2[33:17] + MultiplicationResult3[33:17];
	 assign imgPart = MultiplicationResult1[16:0] + MultiplicationResult2[16:0] + MultiplicationResult3[16:0];
	 
	 always @(posedge Clk) begin
		if (Reset) begin
			Output1 <= 38'h0000000000;
			counter <= 2'b00;
			i = 0;
		end
		else begin
			case(Control)
			state0: begin
				cordic_in <= (Input1*Input1) + (Input2*Input2);
				Output1 <= cordic_out;
				counter <= 2'b00;
				i = 0;
			end
			state1: begin
				InputMultiplier1 <= Input1;
				InputMultiplier2 <= Input2;
				Output1 <= MultiplicationResult;
				counter <= 2'b00;
				i = 0;
			end
			state2: begin
				i = 0;
				case(counter)
				2'b00: begin
					counter <= counter + 1'b1;
					multAdd1_in1 <= Input1;
					multAdd1_in2 <= Input2;
				end
				2'b01: begin
					counter <= counter + 1'b1;
					multAdd2_in1 <= Input1;
					multAdd2_in2 <= Input2;
				end
				2'b10: begin
					counter <= counter + 1'b1;
					multAdd3_in1 <= Input1;
					multAdd3_in2 <= Input2;
				end
				2'b11: begin
					Output1 <= multAdd3_p;
				end
				endcase
			end
			state3: begin
				counter <= 2'b00;
				if (i < 9) begin
					temp_mem1[i] <= Input1;
					temp_mem2[i] <= Input2;
					i = i + 1;
					j = 0;
				end
				else begin
					if (i < 18) begin
						multAdd1_in1 <= temp_mem1[i-9];
						multAdd2_in1 <= temp_mem1[i-8];
						multAdd3_in1 <= temp_mem1[i-7];
						if (j < 3) begin
							multAdd1_in2 <= temp_mem1[j];
							multAdd2_in2 <= temp_mem1[j+3];
							multAdd3_in2 <= temp_mem1[j+6];
							j = j + 1;
						end
						else begin
							j = 0;
							i = i + 3;
						end
					end
					Output1 <= {realPart, imgPart};
				end
			end
			endcase
		end
	 end
	 
	 
	CORDIC cordic (
		.x_in(cordic_in), // input [32 : 0] x_in
		.x_out(cordic_out), // output [16 : 0] x_out
		.clk(Clk) // input clk
	);
	
	ComplexMultiplier complexMultiplier (
    .Clk(Clk), 
    .Reset(Reset), 
    .InputMultiplier1(InputMultiplier1), 
    .InputMultiplier2(InputMultiplier2), 
    .MultiplicationResult(MultiplicationResult)
    );
	 
	MultAdd1 multAdd1 (
		.clk(Clk), // input clk
		.ce(1'b1), // input ce
		.sclr(Reset), // input sclr
		.a(multAdd1_in1), // input [15 : 0] a
		.b(multAdd1_in2), // input [15 : 0] b
		.c(2'b00), // input [1 : 0] c
		.subtract(1'b0), // input subtract
		.p(multAdd1_p), // output [32 : 0] p
		.pcout(multAdd1_pcout) // output [47 : 0] pcout
	);
	
	MultAdd2 multAdd2 (
		.clk(Clk), // input clk
		.ce(1'b1), // input ce
		.sclr(Reset), // input sclr
		.a(multAdd2_in1), // input [15 : 0] a
		.b(multAdd2_in2), // input [15 : 0] b
		.c(multAdd1_p), // input [47 : 0] c
		.pcin(multAdd1_pcout), // input [47 : 0] pcin
		.subtract(1'b0), // input subtract
		.p(multAdd2_p), // output [33 : 0] p
		.pcout(multAdd2_pcout) // output [47 : 0] pcout
	);
	
	MultAdd3 multAdd3 (
		.clk(Clk), // input clk
		.ce(1'b1), // input ce
		.sclr(Reset), // input sclr
		.a(multAdd3_in1), // input [15 : 0] a
		.b(multAdd3_in2), // input [15 : 0] b
		.c(multAdd2_p), // input [47 : 0] c
		.pcin(multAdd2_pcout), // input [47 : 0] pcin
		.subtract(1'b0), // input subtract
		.p(multAdd3_p), // output [34 : 0] p
		.pcout(multAdd3_pcout) // output [47 : 0] pcout
	);
	
	ComplexMultiplier complexMultiplier1 (
    .Clk(Clk), 
    .Reset(Reset), 
    .InputMultiplier1(Multiplier1_Input1), 
    .InputMultiplier2(Multiplier1_Input2), 
    .MultiplicationResult(MultiplicationResult1)
    );
	 
	 ComplexMultiplier complexMultiplier2 (
    .Clk(Clk), 
    .Reset(Reset), 
    .InputMultiplier1(Multiplier2_Input1), 
    .InputMultiplier2(Multiplier2_Input2), 
    .MultiplicationResult(MultiplicationResult2)
    );
	 
	 ComplexMultiplier complexMultiplier3 (
    .Clk(Clk), 
    .Reset(Reset), 
    .InputMultiplier1(Multiplier3_Input1), 
    .InputMultiplier2(Multiplier3_Input2), 
    .MultiplicationResult(MultiplicationResult3)
    );

endmodule

