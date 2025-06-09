// Animation

module animation
	(
		CLOCK_50,						//	On Board 50 MHz
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
	input	[2:0]	KEY;					//	Button[2:0]
	output			VGA_CLK;   				//	VGA Clock
	output			VGA_HS;					//	VGA H_SYNC
	output			VGA_VS;					//	VGA V_SYNC
	output			VGA_BLANK;				//	VGA BLANK
	output			VGA_SYNC;				//	VGA SYNC
	output	[9:0]	VGA_R;   				//	VGA Red[9:0]
	output	[9:0]	VGA_G;	 				//	VGA Green[9:0]
	output	[9:0]	VGA_B;   				//	VGA Blue[9:0]
	
	wire resetn, plot, blank;
	assign resetn = KEY[0];
	assign plot = ~KEY[1];
	assign blank = ~KEY[2];
	
	// Create the color, x, y and writeEn wires that are inputs to the controller.

	wire [7:0] x  , final_x;
	wire [6:0] y , final_y;
	reg [2:0] color = 3'b000;
	reg writeEn = 1'b0;
	reg [1:0] state = waiting;
	reg [4:0] count_x = 4'h0, count_y = 4'h0;
	reg [7:0] xPointer;
	reg [6:0] yPointer;

	parameter waiting = 2'b00, plotting = 2'b10, deleting = 2'b01, finished = 2'b11;

	assign x = 8'd50;
	assign y = 7'd50;
	assign final_x = xPointer + count_x;
	assign final_y = yPointer + count_y;

	initial begin
		xPointer = x;
		yPointer = y;
	end


	always @(posedge CLOCK_50) begin
		if (~resetn) begin
			writeEn = 1'b0;
			state = waiting;
			count_x = 4'h0;
			count_y = 4'h0;
			xPointer = x;
			yPointer = y;
			color = 3'b000;
		end
		else begin
            case (state)
            waiting: begin
                if (plot) begin
                    state <= plotting;
                    color <= q_sig;
                    count_x <= 4'h0;
                    count_y <= 4'h0;
                    xPointer <= x;
                    yPointer <= y;
                    writeEn <= 1'b1;
                    address_sig <= address_sig + 1'b1;
                end
                else if (blank) begin
                    state <= deleting;
                    color <= 3'b000;
                    count_x <= 4'h0;
                    count_y <= 4'h0;
                    xPointer <= x;
                    yPointer <= y;
                    writeEn <= 1'b1;
                end
                else begin
                    state <= waiting;
                end
            end
            plotting: begin
                if (count_y < 16 ) begin
                    color <= q_sig;
                    address_sig <= address_sig + 1'b1;
                    if (count_x < 15) begin
                        count_x <= count_x + 1'b1;
                    end
                    else begin
                        count_y <= count_y + 1'b1;
                        count_x <= 4'h0;
                    end
                end
                else begin
                    state <= finished;
                    address_sig <= 8'h00;
                    writeEn = 1'b0;
                end
            end
            deleting: begin
                if (count_y < 16 ) begin
                    if (count_x < 15) begin
                        count_x <= count_x + 1'b1;
                    end
                    else begin
                        count_y <= count_y + 1'b1;
                        count_x <= 4'h0;
                    end
                end
                else begin
                    state <= finished;
                    writeEn = 1'b0;
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
	end


	// Create an Instance of a VGA controller - there can be only one!
	// Define the number of colours as well as the initial background
	// image file (.MIF) for the controller.
	vga_adapter VGA(
			.resetn(resetn),
			.clock(CLOCK_50),
			.colour(color),
			.x(final_x),
			.y(final_y),
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


	reg [7:0] address_sig = 8'h00;
	wire [2:0] q_sig;


	myRam	myRam_inst (
	.address ( address_sig ),
	.data ( 3'b000 ),
	.inclock ( CLOCK_50 ),
	.wren ( 1'b0 ),
	.q ( q_sig )
	);
	defparam myRam_inst.altsyncram_component.init_file = "image.mif";
	
endmodule