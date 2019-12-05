
module nes_to_motor (input logic 	forward,
												backward,
												left,
												right,
												
							output logic	motor_1_on,
												motor_1_dir,
												motor_2_on,
												motor_2_dir);
			
	// Internal (NO DOUBLE INPUTS)
	logic int_forward 	= 0;
	logic int_backward 	= 0;
	logic int_left 		= 0;
	logic int_right 		= 0;
				
	always_comb begin
	
		int_forward 	= forward 	&& (forward ^ backward ^ left ^ right);
		int_backward 	= backward 	&& (forward ^ backward ^ left ^ right);
		int_left 		= left 		&& (forward ^ backward ^ left ^ right);
		int_right 		= right 		&& (forward ^ backward ^ left ^ right);
	
		motor_1_on 	= 	int_left || int_right || int_forward || int_backward;
		motor_1_dir = 	int_backward || int_left;
		
		motor_2_on 	= 	int_left || int_right || int_forward || int_backward;
		motor_2_dir = 	int_forward || int_left;
	
	end

endmodule