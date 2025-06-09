`timescale 1ns / 1ps
module tb_ALU;

    reg clk;
	 reg reset;
	 reg [1:0] control;
    reg [15:0] in1 = 16'b0000000000000001; 
    reg [15:0] in2 = 16'b0000000000000001;
    wire [37:0] result; 
    wire [37:0] p1; 
    wire [37:0] p2; 
    wire [37:0] p3; 


    // Instantiate the ALU module
    ALU my_ALU (
		 .clk(clk), 
		 .reset(reset), 
		 .control(control), 
		 .Input1(in1), 
		 .Input2(in2), 
		 .Output1(result),
		 .p1_reg(p1),
		 .p2_reg(p2),
		 .p3_reg(p3)
    );

    // Clock generation
    always #10 clk = ~clk; // 20 ns period (toggle every 10 ns)

    // Monitor for debugging (optional)
    always @(posedge clk) begin
        $display("Time = %t | result = %d", $time, result);
    end

    // Simulation duration
    initial begin
			clk = 0;
			reset = 1;
			control = 2'b00;
    end
	 initial begin
			#100;
			control = 2'b00;
			#100;
			control = 2'b01;
			#200;
			control = 2'b10;
			#4000;
			$finish;
    end
	 initial begin
			#600;
			in1 = 16'b0000000000000010;
			in2 = 16'b0000000000000010;
			#200;
			in1 = 16'b0000011100000000;
			in2 = 16'b0000000000000001;
    end

endmodule
