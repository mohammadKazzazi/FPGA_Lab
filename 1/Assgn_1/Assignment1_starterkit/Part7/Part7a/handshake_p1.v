module handshake_p1(input clock, reset,
					input [3:0] ps2_data, input ts,
					output reg [3:0] leds);

always @(posedge clk) begin
	if(reset)begin
		leds <= 4'b0;
		end
	else begin
		if(ts)begin
			leds <= ps2_data;
		end
	end
	
end

endmodule
