module complexMultiplier(
	input clk,
	input reset,
	input [15:0] InputMultiplier1,
	input [15:0] InputMultiplier2,
	output [31:0] MultiplicationResult
	);
	
	reg signed [15:0] MultResult_R1R2;
	reg signed [15:0] MultResult_R1I2;
	reg signed [15:0] MultResult_R2I1;
	reg signed [15:0] MultResult_I1I2;
	reg signed [31:0] MultiplicationResult_reg;
	
	assign MultiplicationResult = MultiplicationResult_reg;
	
	always@(posedge clk or negedge reset) begin
		if(!reset) begin
			MultiplicationResult_reg <= 0;
		end
		else begin 
			MultResult_R1R2 <= InputMultiplier1[15:8] * InputMultiplier2[15:8];
			MultResult_R1I2 <= InputMultiplier1[15:8] * InputMultiplier2[7:0];
			MultResult_R2I1 <= InputMultiplier1[7:0] * InputMultiplier2[15:8];
			MultResult_I1I2 <= InputMultiplier1[7:0] * InputMultiplier2[7:0];
			
			MultiplicationResult_reg[31:16] <= MultResult_R1R2 - MultResult_I1I2;
			MultiplicationResult_reg[15:0] <= MultResult_R1I2 + MultResult_R2I1;
		end
	end
		
	
	

endmodule
