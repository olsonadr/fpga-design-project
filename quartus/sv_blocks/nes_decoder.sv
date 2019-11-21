
module nes_decoder (input  logic 	nes_data,  	// the current button data coming from controller
												in_clock,  	// will synchronize output to the positive edge of this
												read_data, 	// will read the data on the positive edge of this input
												reset,	  	// does nothing so far
								  
						  output logic 	nes_latch, 	// sent to controller, begins process of reading
												nes_clock,	// sent to controller, tells controller to send the next button
									
						  output	logic 	nes_A,		// A button output, active low
												nes_B,		// B button output, active low
												nes_START,	// START button output, active low
												nes_SELECT,	// SELECT button output, active low
												nes_UP,		// UP button output, active low
												nes_DOWN,	// DOWN button output, active low
												nes_LEFT,	// LEFT button output, active low
												nes_RIGHT,	// RIGHT button output, active low
									
						  output logic		ready_to_read); // output telling system whether the module is ready to read
						  
						  
		
		// Parameter
		localparam 						NUM_BUTTONS = 8;
		
		// Internal
		logic	 [3:0] 					count = 2'b00;
		logic 							next = 0;
		logic								apply = 0;
		logic	 [NUM_BUTTONS-1:0] 	tmp_buttons = 1;
		
		// Initial outputs
		assign 	ready_to_read 	= 1;
		assign 	nes_latch 		= 0;
		assign	nes_clock 		= 0;
		assign 	nes_A 			= 1;
		assign 	nes_B 			= 1;
		assign 	nes_START 		= 1;
		assign 	nes_SELECT 		= 1;
		assign 	nes_UP 			= 1;
		assign 	nes_DOWN 		= 1;
		assign 	nes_LEFT 		= 1;
		assign 	nes_RIGHT 		= 1;
		
		
		// Initiate read (this should only come in when ready to read is high)
		always_ff @(posedge read_data)
			begin
				nes_latch 		= 1;
				ready_to_read 	= 0;
			end
		
		
		
		// Start reading process if latch, read until all buttons read, apply after
		always_ff @(posedge in_clock)
			begin
			
				if (nes_latch)
					begin
						nes_latch 		=	0;
						count				=	0;
						tmp_buttons		= 	1;
						next 				= 	1;
					end
				else if (next)
					begin
						// Ensure no double-execution
						next = 0;
						nes_clock = 0;
						
						// Read data into current button
						tmp_buttons[count] = nes_data;
						
						// Move to next button or stop reading
						if (count < NUM_BUTTONS)
						begin
								// Increment to next button
								count 		= count + 1;
								nes_clock 	= 1;
								next 			= 1;
								apply 		= 0;
						end
						else
						begin
								// Reset and start applying
								count 		= 0;
								nes_clock 	= 0;
								next 			= 0;
								apply 		= 1;
						end
					end
				else if (apply)
					begin		
						nes_A 			= tmp_buttons[0];
						nes_B 			= tmp_buttons[1];
						nes_START 		= tmp_buttons[2];
						nes_SELECT 		= tmp_buttons[3];
						nes_UP 			= tmp_buttons[4];
						nes_DOWN 		= tmp_buttons[5];
						nes_LEFT 		= tmp_buttons[6];
						nes_RIGHT 		= tmp_buttons[7];
					
						tmp_buttons 	= 1;
						ready_to_read 	= 1;
					end
					
			end
			
endmodule