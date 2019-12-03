
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
		logic	 [NUM_BUTTONS-1:0]	prev_input	= {NUM_BUTTONS{1'b1}};
		logic								tmp_ready	= 0;
		
		// Start reading process if latch, read until all buttons read, apply after
		always_ff @(posedge in_clock, posedge read_data, posedge reset) begin
		
				if (reset) begin
					/* On reset, set to default values */
					
						tmp_ready	 	= 1;
						nes_latch 		= 0;
						nes_clock 		= 0;
						tmp_buttons 	= {NUM_BUTTONS{1'b1}};
						next 				= 0;
						apply				= 0;
						count				= 0;
						tmp_ready	 	= 1;
						
				end
				else if (read_data) begin
					/* On start (read_data) if the system is ready to read (ready_to_read),
					 * send nes_latch signal to controller to start reading process, signal system
					 * is no longer ready to read, and set that it should read the next value. */
					 
						if (tmp_ready) begin
							nes_latch 		=	1;
							tmp_ready		=	0;
							count				=	0;
							tmp_buttons		= 	{NUM_BUTTONS{1'b1}};
							next 				= 	1;
						end
						
				end
				else if (pause) begin
					/* In between each read (after each [next] case where a button is read),
					 * either send the system to the apply state or to the next button read
					 * depending on if we have read all buttons; gives nes_clock time to be 0. */
					 
						next	 		= (count < NUM_BUTTONS);
						nes_clock 	= (count < NUM_BUTTONS);
						apply 		= ~(count < NUM_BUTTONS);
						pause			= 0;
						
				end
				else if (next)	begin
					/* Read the next button and set its place in the tmp_button reg. */
				
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
					/* Apply state, send out the buttons read so far by the decoder 
					 * to prev_input to be sent to the outputs. */
					
						prev_input		= tmp_buttons;
						tmp_buttons 	= {NUM_BUTTONS{1'b1}};
						apply 			= 0;
						tmp_ready		= 1;
						
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
						ready_to_read	= tmp_ready;
						
			end
			
endmodule