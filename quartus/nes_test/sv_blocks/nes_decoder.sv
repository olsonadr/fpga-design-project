
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
		logic	 [3:0] 					count = 3'b0000;
		logic								pause = 0;
		logic 							next = 0;
		logic								apply = 0;
		logic	 [NUM_BUTTONS-1:0] 	tmp_buttons = {NUM_BUTTONS{1'b1}};
		logic	 [NUM_BUTTONS-1:0]	prev_input	= tmp_buttons;
		
		// Start reading process if latch, read until all buttons read, apply after
		always_ff @(posedge in_clock, posedge read_data, posedge reset) begin
		
				if (reset) begin
						ready_to_read 	= 1;
						nes_latch 		= 0;
						nes_clock 		= 0;
						tmp_buttons 	= {NUM_BUTTONS{1'b1}};
						next 				= 0;
						apply				= 0;
						count				= 0;
						ready_to_read 	= 1;
				end
				else if (read_data && ready_to_read) begin
						nes_latch 		=	1;
						ready_to_read	=	0;
						count				=	0;
						tmp_buttons		= 	{NUM_BUTTONS{1'b1}};
						next 				= 	1;
				end
				else if (pause) begin
						next	 		= (count < NUM_BUTTONS);
						nes_clock 	= (count < NUM_BUTTONS);
						apply 		= ~(count < NUM_BUTTONS);
						pause			= 0;
				end
				else if (next)	begin
						// Set pulsed items to 0
						nes_latch 	= 0;
						nes_clock 	= 0;
				
						// Read data into current button
						tmp_buttons[count] = nes_data;
						
						// Trigger next execution logic (pause)
						pause = 1;
						
						// Increment count
						count = (count < NUM_BUTTONS) ? count + 1 : 0;
				end
				else if (apply) begin
						prev_input		= tmp_buttons;
						tmp_buttons 	= {NUM_BUTTONS{1'b1}};
						apply 			= 0;
						ready_to_read 	= 1;
				end
					
			end
			
			always_comb begin
			
						nes_A 			= prev_input[0];
						nes_B 			= prev_input[1];
						nes_START 		= prev_input[2];
						nes_SELECT 		= prev_input[3];
						nes_UP 			= prev_input[4];
						nes_DOWN 		= prev_input[5];
						nes_LEFT 		= prev_input[6];
						nes_RIGHT 		= prev_input[7];
						
			end
			
endmodule