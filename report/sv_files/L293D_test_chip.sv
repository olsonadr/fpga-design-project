
// https://www.st.com/content/ccc/resource/technical/document/datasheet/04/ac/22/f9/20/5d/43/a1/CD00000059.pdf/files/CD00000059.pdf/jcr:content/translations/en.CD00000059.pdf

// Delay will have scale of 1ns per #n listed (resolution 100ps)
`timescale 1ns/100ps

module L293D_test_chip (
	input	logic		enable_1,	// pin 1 	- 	enable for inputs 1 and 2
						input_1,		// pin 2 	- 	input 1 (forward for motor 1)
						input_2,		// pin 7 	- 	input 2 (backward for motor 1)
						
						enable_2,	// pin 9		- 	enable for inputs 3 and 4
						input_3,		// pin 10	- 	input 3 (forward for motor 2)
						input_4,		// pin 15	- 	input 4 (backward for motor 2)
					
	output logic	output_1,	// pin 3		- 	output 1 (forward for motor 1)
						output_2,	// pin 6		- 	output 2 (backward for motor 2)
						
						output_3,	// pin 11	- 	output 3 (forward for motor 3)
						output_4	// pin 14	-	output 4 (backward for motor 4)
	);
	
	always_comb begin
		
		output_1 <= (enable_1) ? (input_1) : (1'bz);
		output_2 <= (enable_1) ? (input_2) : (1'bz);
	
		output_3 <= (enable_2) ? (input_3) : (1'bz);
		output_4 <= (enable_2) ? (input_4) : (1'bz);
	end
	
endmodule