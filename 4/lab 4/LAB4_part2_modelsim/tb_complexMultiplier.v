module tb_ComplexMultiplier;

    reg clk;
	 reg reset;
    reg [15:0] in1 = 16'b0000000000000001; 
    reg [15:0] in2 = 16'b0000000000000010;
    wire [31:0] result; 

    // Instantiate the ComplexMultiplier module
    complexMultiplier my_multiplier (
		  .clk(clk),
		  .reset(reset),
        .InputMultiplier1(in1),
        .InputMultiplier2(in2),
        .MultiplicationResult(result)
    );

    // Clock generation
    always #100 clk = ~clk; // 200 ns period (toggle every 100 ns)

    // Monitor for debugging (optional)
    always @(posedge clk) begin
        $display("Time = %t | result = %d", $time, result);
    end

    // Simulation duration
    initial begin
        clk = 0;
		  reset = 1;
        #1000; // Simulate for 1000 ns
        $finish; // End simulation
    end

endmodule
