`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:52:58 05/09/2024 
// Design Name: 
// Module Name:    ComplexMultiplier 
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
module ComplexMultiplier(
    input wire Clk,
    input wire Reset,
    input wire [15:0] InputMultiplier1,
    input wire [15:0] InputMultiplier2,
    output wire [33:0] MultiplicationResult
    );

    // declaring part separation...
    wire signed [7:0] real_in_1;
    wire signed [7:0] imag_in_1;
    wire signed [7:0] real_in_2;
    wire signed [7:0] imag_in_2;
    wire signed [16:0] real_out;
    wire signed [16:0] imag_out;

    // declaring multipliers output...
    wire signed [15:0] r1r2;
    wire signed [15:0] i1i2;
    wire signed [15:0] i1r2;
    wire signed [15:0] r1i2;

    // declaring adders output...
    wire signed [16:0] real_part;
    wire signed [16:0] imag_part;

    // declaring final result...
    wire [33:0] final_result;

    // declaring registers...
    reg [33:0] final_result_reg;

    // separation...
    assign real_in_1 = InputMultiplier1[15:8];
    assign imag_in_1 = InputMultiplier1[7 :0];
    assign real_in_2 = InputMultiplier2[15:8];
    assign imag_in_2 = InputMultiplier2[7 :0];

    // calculation...
    assign r1r2 = real_in_1 * real_in_2;
    assign i1i2 = imag_in_1 * imag_in_2;
    assign i1r2 = imag_in_1 * real_in_2;
    assign r1i2 = real_in_1 * imag_in_2;

    assign real_part = r1r2 - i1i2;
    assign imag_part = i1r2 + r1i2;

    // assignment...
    assign final_result = {{real_part}, {imag_part}};
    assign MultiplicationResult = final_result_reg;

    always @(posedge Clk) begin
        if (Reset) begin
            final_result_reg <= 34'd0;
        end else begin
            final_result_reg <= final_result;
        end
    end

endmodule
