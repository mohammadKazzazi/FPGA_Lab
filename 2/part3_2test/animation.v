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
	input	[0:0]	KEY;					//	Button[2:0]
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

	wire [7:0] final_x;
	wire [6:0] final_y;
	reg [7:0] xPointer , change_x;
	reg [6:0] yPointer , change_y;
	reg [2:0] color = 3'b000;
	reg writeEn = 1'b0, xInc = 1'b0, yInc = 1'b0 , refresh = 1'b0;
	reg [4:0] count_x = 4'h0, count_y = 4'h0;
	reg [19:0] counter = 20'h00000;
	reg refresh;


	assign final_x = change_x;
	assign final_y = change_y;


	always @(posedge CLOCK_50) begin
		if (~resetn) begin
			writeEn = 1'b0;
			count_x = 4'h0;
			count_y = 4'h0;
			color = 3'b000;
			xInc = 1'b0;
			yInc = 1'b0;
		end
		else begin
		
            if (refresh) begin
                if (counter < 19200) begin
                    if (change_y < 119) begin
                        if (change_x < 159) begin
                            change_x <= change_x + 1'b1;
                        end
                        else begin
                            change_x <= 8'h00;
                            change_y <= change_y + 1'b1;
                        end
                    end
                    else begin
                        if (change_x < 159) begin
                            change_x <= change_x + 1'b1;
                        end
                        else begin
                            change_x <= xPointer;
                            change_y <= yPointer;
                            color <= q_sig;
                            address_sig <= address_sig + 1'b1;
                            count_x <= count_x + 1'b1;
                        end
                    end
                    counter <= counter + 1'b1;
                end
                else begin
                    change_x <= xPointer + count_x;
                    change_y <= yPointer + count_y;
                    if (count_y < 16) begin
                        color <= q_sig;
                        address_sig <= address_sig + 1'b1;
                        if (count_x<15) begin
                            count_x <= count_x + 1'b1;
                        end
                        else begin
                            count_y <= count_y + 1'b1;
                            count_x <= 4'h0;
                        end
                    end
                    else begin
                        refresh <= 1'b0;
                        writeEn = 1'b0;
                        counter <= 20'h00000;
                    end
                end
            end
            else begin
                if (counter == 1000000) begin
                    count_x <= 4'h0;
                    count_y <= 4'h0;
                    writeEn <= 1'b1;
                    color <= 3'b000;
                    refresh <= 1'b1;
                    counter <= 20'h00000;
                    change_x <= 8'h00;
                    change_y <= 7'h00;
                    address_sig <= 8'h00;yPointer
                    if (xInc) xPointer <= xPointer - 2'd2;
                    else xPointer <= xPointer + 2'd2;
                    if (yInc) yPointer <= yPointer - 1'b1;
                    else yPointer <= yPointer + 1'b1;
                    if (xPointer > 146) begin
                        xInc <= 1'b1;
                    end
                    else if (xPointer == 8'h01) begin
                        xInc <= 1'b0;
                    end
                    else xInc <= xInc;
                    if (yPointer > 104) begin
                        yInc <= 1'b1;
                    end
                    else if (yPointer == 7'h01) begin
                        yInc <= 1'b0;
                    end
                    else yInc <= yInc;
                end
                else begin
                    counter <= counter + 1'b1;
                end
            end
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
	.address_sig_sig ( address_sig ),
	.data ( 3'b000 ),
	.inclock ( inclock_sig ),
	.wren ( 1'b0 ),
	.q ( q_sig )
	);
	defparam myRam_inst.altsyncram_component.init_file = "image.mif";
	
endmodule