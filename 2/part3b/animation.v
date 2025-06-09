// Animation

module animation
	(
		CLOCK_50,						//	On Board 50 MHz
		KEY,							//	Push Button[3:0]  
		SW,								//	Push Switch[3]
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
	input	[2:0]	KEY;					//	Button[3:0]  key[0] is for reset, key[1] is for ploting, and key[2] is for erasing 
	input	[11:0]	SW;
	output			VGA_CLK;   				//	VGA Clock
	output			VGA_HS;					//	VGA H_SYNC
	output			VGA_VS;					//	VGA V_SYNC
	output			VGA_BLANK;				//	VGA BLANK
	output			VGA_SYNC;				//	VGA SYNC
	output	[9:0]	VGA_R;   				//	VGA Red[9:0]
	output	[9:0]	VGA_G;	 				//	VGA Green[9:0]
	output	[9:0]	VGA_B;   				//	VGA Blue[9:0]
	
	wire resetn;
	assign resetn = KEY[0];
	
	// Create the color, x, y and writeEn wires that are inputs to the controller.

	wire [2:0] color;
	wire [7:0] x;
	wire [6:0] y;
	reg writeEn;

	reg [2:0] color_er_or_plot = BLACK; 
	assign color = color_er_or_plot;
	
	// Create an Instance of a VGA controller - there can be only one!
	// Define the number of colours as well as the initial background
	// image file (.MIF) for the controller.
	vga_adapter VGA(
			.resetn(resetn),
			.clock(CLOCK_50),
			.colour(color),
			.x(x),
			.y(y),
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
		defparam VGA.BACKGROUND_IMAGE = "";
			
	// Put your code here. Your code should produce signals x,y,color and writeEn
	// for the VGA controller, in addition to any other functionality your design may require.
	
	wire[2:0] q_sig;
	wire[7:0] address_sig;
	assign address_sig = counter_X + 5'd16 * counter_Y;

	RAM	RAM_inst (
	.address ( address_sig ),
	.clock ( CLOCK_50 ),
	.data ( 3'b000 ),
	.wren ( 1'b0 ),
	.q ( q_sig )
	);

	parameter BLACK = 3'b000;
	parameter indeterminate = 3'b001,plot = 3'b010,erase = 3'b100;
	reg[2:0] nextState = indeterminate ,currentState = indeterminate;
	reg plot_end = 1'b0 , erase_end = 1'b0; 
	reg[4:0] counter_X = 5'b00000 , counter_Y = 5'b00000;
	wire [5:0] screen_X, screen_Y;
	assign screen_X = SW[5:0];
	assign screen_Y = SW[11:6];
	assign x = screen_X + counter_X;
	assign y = screen_Y + counter_Y;

	always@(*) begin
		case (currentState)
			indeterminate : begin
				writeEn = 1'b0;
				if (!KEY[1] & !plot_end) begin
					nextState = plot;
				end
				else if (!KEY[2] & !erase_end) begin
					nextState = erase;
				end
			end		

			plot : begin
				erase_end = 1'b0;
				writeEn = 1'b1; 
				color_er_or_plot = q_sig;
				if (counter_Y < 5'b10000) begin
					if (counter_X < 5'b10000) begin
						counter_X = counter_X + 1'b1;
					end

					else begin
						counter_X = 5'd0;
						counter_Y = counter_Y + 1'b1;
					end
				end

				else begin
					counter_X = 5'd0;
					counter_Y = 5'd0;
					nextState = indeterminate;
					plot_end = 1'b1;
					writeEn = 1'b0;
				end

			end

			erase : begin
				plot_end = 1'b0;
				writeEn = 1'b1; 
				color_er_or_plot = BLACK;
				if (counter_Y < 5'b10000) begin
					if (counter_X < 5'b10000) begin
						counter_X = counter_X + 5'b00001;
					end

					else begin
						counter_X = 5'b00000;
						counter_Y = counter_Y + 5'b00001;
					end
				end

				else begin
					counter_X = 5'b00000;
					counter_Y = 5'b00000;
					nextState = indeterminate;
					erase_end = 1'b1;
					writeEn = 1'b0;
				end

			end


			default: nextState = indeterminate;
		endcase
	end


	always @(posedge CLOCK_50) begin
		currentState <= nextState;
	end
	
endmodule