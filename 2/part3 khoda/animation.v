// Animation

module animation
	(
		CLOCK_50,						//	On Board 50 MHz
		SWITCH,							// SWITCH[14:0]
		KEY,							//	Push Button[2:0]
		VGA_CLK,   						//	VGA Clock
		VGA_HS,							//	VGA H_SYNC
		VGA_VS,							//	VGA V_SYNC
		VGA_BLANK,						//	VGA BLANK
		VGA_SYNC,						//	VGA SYNC
		VGA_R,   						//	VGA Red[9:0]
		VGA_G,	 						//	VGA Green[9:0]
		VGA_B   						//	VGA Blue[9:0]
	);

	input			CLOCK_50;				//	50 MHz
	input	[15:0]	SWITCH;					// Switch[14:0]
	input	[2:0]	KEY;					//	Button[2:0]
	output			VGA_CLK;   				//	VGA Clock
	output			VGA_HS;					//	VGA H_SYNC
	output			VGA_VS;					//	VGA V_SYNC
	output			VGA_BLANK;				//	VGA BLANK
	output			VGA_SYNC;				//	VGA SYNC
	output	[9:0]	VGA_R;   				//	VGA Red[9:0]
	output	[9:0]	VGA_G;	 				//	VGA Green[9:0]
	output	[9:0]	VGA_B;   				//	VGA Blue[9:0]
	
	wire resetn, plot, blank, mode;
	assign resetn = KEY[0];
	assign plot = ~KEY[1];
	assign blank = ~KEY[2];
	
	// Create the color, x, y and writeEn wires that are inputs to the controller.

	wire [7:0] x;
	wire [6:0] y;
	wire [7:0] x_vga;
	wire [6:0] y_vga;
	reg [7:0] x_motion;
	reg [6:0] y_motion;
	reg [2:0] color;
	reg writeEn, inc_x, inc_y;
	reg [1:0] state;
	reg [3:0] x_count, y_count;
	reg [7:0] x_p;
	reg [6:0] y_p;
	reg [19:0] counter;
	reg refresh;

	parameter waiting = 2'b00, plotting = 2'b10, deleting = 2'b01, finished = 2'b11, animation = 1'b1, static = 1'b0;

	assign x = SWITCH[7:0];
	assign y = SWITCH[14:8];
	assign mode = SWITCH[15];
	assign x_vga = (mode == static)? x_p + x_count : x_motion;
	assign y_vga = (mode == static)? y_p + y_count : y_motion;

	initial begin
		writeEn = 1'b0;
		state = waiting;
		x_count = 4'h0;
		y_count = 4'h0;
		x_p = x;
		y_p = y;
		color = 3'b000;
		counter = 20'h00000;
		refresh = 1'b0;
		inc_x = 1'b0;
		inc_y = 1'b0;
	end


	always @(posedge CLOCK_50) begin
		if (~resetn) begin
			writeEn = 1'b0;
			state = waiting;
			x_count = 4'h0;
			y_count = 4'h0;
			x_p = x;
			y_p = y;
			color = 3'b000;
			inc_x = 1'b0;
			inc_y = 1'b0;
		end
		else begin
			case (mode)
			static: begin
				case (state)
				waiting: begin
					if ((x < 147) & (y < 105)) begin
						if (plot) begin
							state <= plotting;
							color <= q_sig;
							x_count <= 4'h0;
							y_count <= 4'h0;
							x_p <= x;
							y_p <= y;
							writeEn <= 1'b1;
							address <= address + 1'b1;
						end
						else if (blank) begin
							state <= deleting;
							color <= 3'b000;
							x_count <= 4'h0;
							y_count <= 4'h0;
							x_p <= x;
							y_p <= y;
							writeEn <= 1'b1;
						end
						else begin
							state <= waiting;
						end
					end
					else begin
						state <= waiting;
					end
				end
				plotting: begin
					if (~(& y_count)) begin
						color <= q_sig;
						address <= address + 1'b1;
						if (~(& x_count)) begin
							x_count <= x_count + 1'b1;
						end
						else begin
							y_count <= y_count + 1'b1;
							x_count <= 4'h0;
						end
					end
					else begin
						color <= q_sig;
						address <= address + 1'b1;
						if (~(& x_count)) begin
							x_count <= x_count + 1'b1;
						end
						else begin
							state <= finished;
							address <= 8'h00;
							writeEn = 1'b0;
						end
					end
				end
				deleting: begin
					if (~(& y_count)) begin
						if (~(& x_count)) begin
							x_count <= x_count + 1'b1;
						end
						else begin
							y_count <= y_count + 1'b1;
							x_count <= 4'h0;
						end
					end
					else begin
						if (~(& x_count)) begin
							x_count <= x_count + 1'b1;
						end
						else begin
							state <= finished;
							writeEn = 1'b0;
						end
					end
				end
				finished: begin
					if (plot | blank) begin
						state <= finished;
					end
					else begin
						state <= waiting;
					end
				end
				endcase
			end
			animation: begin
				if (refresh) begin
					if (counter < 19200) begin
						if (y_motion < 119) begin
							if (x_motion < 159) begin
								x_motion <= x_motion + 1'b1;
							end
							else begin
								x_motion <= 8'h00;
								y_motion <= y_motion + 1'b1;
							end
						end
						else begin
							if (x_motion < 159) begin
								x_motion <= x_motion + 1'b1;
							end
							else begin
								x_motion <= x_p;
								y_motion <= y_p;
								color <= q_sig;
								address <= address + 1'b1;
								x_count <= x_count + 1'b1;
							end
						end
						counter <= counter + 1'b1;
					end
					else begin
						x_motion <= x_p + x_count;
						y_motion <= y_p + y_count;
						if (~(& y_count)) begin
							color <= q_sig;
							address <= address + 1'b1;
							if (~(& x_count)) begin
								x_count <= x_count + 1'b1;
							end
							else begin
								y_count <= y_count + 1'b1;
								x_count <= 4'h0;
							end
						end
						else begin
							color <= q_sig;
							address <= address + 1'b1;
							if (~(& x_count)) begin
								x_count <= x_count + 1'b1;
							end
							else begin
								refresh <= 1'b0;
								writeEn = 1'b0;
								counter <= 20'h00000;
							end
						end
					end
				end
				else begin
					if (counter == 1000000) begin
						x_count <= 4'h0;
						y_count <= 4'h0;
						writeEn <= 1'b1;
						color <= 3'b000;
						refresh <= 1'b1;
						counter <= 20'h00000;
						x_motion <= 8'h00;
						y_motion <= 7'h00;
						address <= 8'h00;
						if (inc_x) x_p <= x_p - 1'b1;
						else x_p <= x_p + 1'b1;
						if (inc_y) y_p <= y_p - 1'b1;
						else y_p <= y_p + 1'b1;
						if (x_p > 146) begin
							inc_x <= 1'b1;
						end
						else if (x_p == 8'h01) begin
							inc_x <= 1'b0;
						end
						else inc_x <= inc_x;
						if (y_p > 104) begin
							inc_y <= 1'b1;
						end
						else if (y_p == 7'h01) begin
							inc_y <= 1'b0;
						end
						else inc_y <= inc_y;
					end
					else begin
						counter <= counter + 1'b1;
					end
				end
			end
			endcase
		end
	end


	// Create an Instance of a VGA controller - there can be only one!
	// Define the number of colours as well as the initial background
	// image file (.MIF) for the controller.
	vga_adapter VGA(
			.resetn(resetn),
			.clock(CLOCK_50),
			.colour(color),
			.x(x_vga),
			.y(y_vga),
			.plot(writeEn),
			/* Signals for the DAC to drive the monitor. */
			.VGA_R(VGA_R),
			.VGA_G(VGA_G),
			.VGA_B(VGA_B),
			.VGA_HS(VGA_HS),
			.VGA_VS(VGA_VS),
			.VGA_BLANK(VGA_BLANK),
			.VGA_SYNC(VGA_SYNC),
			.VGA_CLK(VGA_CLK));
		defparam VGA.RESOLUTION = "160x120";
		defparam VGA.MONOCHROME = "FALSE";
		defparam VGA.BITS_PER_COLOUR_CHANNEL = 1;
		defparam VGA.BACKGROUND_IMAGE = "display.mif";
		
	// Put your code here. Your code should produce signals x,y,color and writeEn
	// for the VGA controller, in addition to any other functionality your design may require.


	reg [7:0] address;
	wire [2:0] data_sig, q_sig;
	wire gnd;
	assign data_sig = 3'b000;
	assign gnd = 1'b0;
	initial begin
		address = 8'h00;
	end

	myRam	myRam_inst (
	.address ( address ),
	.data ( data_sig ),
	.inclock ( CLOCK_50 ),
	.wren ( gnd ),
	.q ( q_sig )
	);
	defparam myRam_inst.altsyncram_component.init_file = "image.mif";
	
endmodule