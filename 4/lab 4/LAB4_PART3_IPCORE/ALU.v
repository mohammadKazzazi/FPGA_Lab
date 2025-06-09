// last thing i wanted to do was to perform reset action 
//and then apply state machine of vector mult

module ALU(
    input clk,
    input reset,
    input [1:0] control,
    input [15:0] Input1,
    input [15:0] Input2,
    output [37:0] Output1,
	 output reset_MultAdd,		//just testing reset for multadds
	 output reg [37:0] p1_reg,
	 output reg [37:0] p2_reg,
	 output reg [37:0] p3_reg
    );
	 
	reg [37:0] Output1_reg;
	assign Output1 = Output1_reg;
	
	// Input and Outputs for state 00 (square root)
	reg [31:0] Input1_sq;
	reg [31:0] Input2_sq;
	reg [32:0] SumOfSquares;
	wire [16:0] SquareRoot;
	
	// Input and Outputs for state 01 (complex multiplication)
	reg [15:0] InputMultiplier1;
	reg [15:0] InputMultiplier2;
	wire [31:0] MultiplicationResult;
	
	// Input and Outputs for state 10 (vector multiplication)
	reg clear_MultAdd = 0;
	assign reset_MultAdd = clear_MultAdd | !reset;
	reg [15:0] a1; 
	reg [15:0] b1;
	reg [15:0] a2; 
	reg [15:0] b2;
	reg [15:0] a3; 
	reg [15:0] b3;
	
	wire [32:0] p1;
	wire [47:0] pcout1;
	wire [33:0] p2;
	wire [47:0] pcout2;
	wire [34:0] p3;
	wire [47:0] pcout3;
	
	/*
	// state machine 
	reg [1:0] CS_VM;
	reg [1:0] NS_VM;
	parameter 	getting_1st_elements = 4'b00,
					getting_2nd_elements = 4'b01, 
					getting_3rd_elements = 4'b10,
					clear_elements = 4'b11;
	*/
					
	reg [5:0] counter_SM_VM = 0;
	

	// Main Logic
	always@(posedge clk) begin 
		p1_reg <= p1;
		p2_reg <= p2;
		p3_reg <= p3;
		case (control)
			// Taking square root of inputs
			2'b00: begin
				Input1_sq <= Input1 * Input1;
				Input2_sq <= Input2 * Input2;
				SumOfSquares <= Input1_sq + Input2_sq;
				Output1_reg <= SquareRoot;
			end
			// Complex multiplication
			2'b01: begin
				InputMultiplier1 <= Input1;
				InputMultiplier2 <= Input2;
				Output1_reg <= MultiplicationResult;
			end
			// Vector multiplication
			2'b10: begin
				if(counter_SM_VM < 10) begin
					a1 <= Input1;
					b1 <= Input2;
					counter_SM_VM <= counter_SM_VM +1;
				end
				else if(counter_SM_VM < 20) begin
					a2 <= Input1;
					b2 <= Input2;
					counter_SM_VM <= counter_SM_VM +1;
				end
				else if(counter_SM_VM < 30) begin
					a3 <= Input1;
					b3 <= Input2;
					counter_SM_VM <= counter_SM_VM +1;
				end
				else begin
					counter_SM_VM <=0;
				end
				Output1_reg <= p3_reg;
				
				
			end
		endcase
	end
	
	
	
	CORDIC_sqroot my_CORDIC_sqroot (
	  .x_in(SumOfSquares), 		// input [32 : 0] x_in
	  .x_out(SquareRoot), 		// output [16 : 0] x_out
	  .clk(clk) 					// input clk
	);
	
	complexMultiplier my_complexMultiplier (
    .clk(clk), 
    .reset(reset), 
    .InputMultiplier1(InputMultiplier1), 
    .InputMultiplier2(InputMultiplier2), 
    .MultiplicationResult(MultiplicationResult)
    );
	 
	 MultAdd1 my_MultAdd1 (
	  .clk(clk), 								// input clk
	  .ce(1'b1), 								// input clock enable 	 (set to 1 all the time)
	  .sclr(reset_MultAdd), 				// input sclr 				 (synchronous clear active HIGH)
	  .a(a1), 									// input [15 : 0] a
	  .b(b1), 									// input [15 : 0] b
	  .c(2'b00), 								// input [1 : 0] c
	  .subtract(1'b0), 						// input subtract 		 (set to 1 all the time to apply summation) 
	  .p(p1), 									// output [32 : 0] p
	  .pcout(pcout1) 							// output [47 : 0] pcout
	);
	
	MultAdd2 my_MultAdd2 (
	  .clk(clk), 								// input clk
	  .ce(1'b1), 								// input ce              (set to 1 all the time)
	  .sclr(reset_MultAdd), 							// input sclr            (synchronous clear active HIGH)
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
	  .sclr(reset_MultAdd), 							// input sclr            (synchronous clear active HIGH)
	  .a(a3), 									// input [15 : 0] a
	  .b(b3), 									// input [15 : 0] b
	  .c(p2), 									// input [47 : 0] c
	  .pcin(pcout2), 							// input [47 : 0] pcin
	  .subtract(1'b0), 						// input subtract        (set to 1 all the time to apply summation) 
	  .p(p3), 									// output [34 : 0] p
	  .pcout(pcout3) 							// output [47 : 0] pcout
	);
endmodule
