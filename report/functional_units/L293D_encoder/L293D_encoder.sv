
/* Takes input as 4-bit register describing whether 
	each motor is on and its direction */

module L293D_encoder (
	input	logic		motor_1_on,		// whether the first motor should spin
						motor_1_dir,	//	the direction of spin (0 is back, 1 is forward)
						
						motor_2_on,		// whether the second motor should spin
						motor_2_dir,	// the direction of spin (0 is back, 1 is forward)
							
	output logic	enable_1,	// pin 1 	- 	enable for inputs 1 and 2
						input_1,		// pin 2 	- 	input 1 (forward for motor 1)
						input_2,		// pin 7 	- 	input 2 (backward for motor 1)
					
						enable_2,	// pin 9		- 	enable for inputs 3 and 4
						input_3,		// pin 10	- 	input 3 (forward for motor 2)
						input_4		// pin 15	- 	input 4 (backward for motor 2)
	);

	always_comb begin
		enable_1 	<=  motor_1_on;
		input_1		<= (motor_1_on &&  (motor_1_dir));
		input_2		<= (motor_1_on && ~(motor_1_dir));
	
		enable_2 	<=  motor_2_on;
		input_3		<= (motor_2_on &&  (motor_2_dir));
		input_4		<= (motor_2_on && ~(motor_2_dir));
	end

endmodule