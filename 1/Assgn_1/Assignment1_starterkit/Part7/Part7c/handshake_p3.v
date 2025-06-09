module handshake_p3(input clock, reset,
					input [3:0] ps2_data, input ps2_en,
					output [3:0] sound_code,	// Code for the music box
					input data_rq,		// Data request from music box
					output data_rd);		// Data ready for music box

// Your code goes here...

parameter music_play = 3'b000 , wait_input = 3'b001 , get_input = 3'b010;
reg [2:0] Current_state , Next_state;

reg [3:0] music;
reg data_ready;


initial begin
	Current_state = wait_input;
end

always@(*) begin
	case(Current_state)

		wait_input : begin
			if (data_rq) begin
				Next_state = get_input;
			end
		end

		get_input : begin
			if (ps2_en) begin
				music = ps2_data;
				Next_state = music_play; 
			end
		end

		music_play : begin
			data_ready = 1'b1;

			if (!data_rq) begin
				Next_state = wait_input;
				data_ready = 1'b0;
			end
		end


		endcase

end

always @(posedge clock) begin
	if(!reset)begin
		Current_state <= wait_input;
		music <= 4'b0;
		data_ready <= 1'b0;
	end

	else begin
	Current_state <= Next_state;
	end

end


assign sound_code = music;
assign data_rd = data_ready;

endmodule
