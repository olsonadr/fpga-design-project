module parser #(parameter IN_BITS=30, TICK_PER_SEC=9537)
					(input logic [IN_BITS-1:0] count,
					 output logic [IN_BITS-1:0] total_seconds,
					 output logic [3:0] seconds_ones,
					 output logic [3:0] seconds_tens,
					 output logic [3:0] minutes_ones,
					 output logic [3:0] minutes_tens,
					 output logic [3:0] hours_ones,
					 output logic [3:0] hours_tens);

	reg 	[5:0] 			seconds;
	reg 	[5:0] 			minutes;
	reg	[4:0]				hours;

	always_comb
		begin	
			total_seconds = count / TICK_PER_SEC;
		
			seconds = total_seconds % 60;
			seconds_ones = seconds % 10;
			seconds_tens = seconds / 10;
			
			minutes = (total_seconds / 60) % 60;
			minutes_ones = minutes % 10;
			minutes_tens = minutes / 10;
			
			hours = (total_seconds / 3600) % 24;
			hours_ones = hours % 10;
			hours_tens = hours / 10;
		end
		
endmodule