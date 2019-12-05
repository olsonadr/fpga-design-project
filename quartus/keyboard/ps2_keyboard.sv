module ps2_keyboard	#(parameter clk_freq = 50_000_000, 
								debounce_counter_size = 8)
								(input logic clk,     //system clock
									input logic ps2_clk,     //clock signal from PS/2 keyboard
									input logic ps2_data,    //data signal from PS/2 keyboard
									output logic ps2_code_new,        //flag that new PS/2 code is available on ps2_code bus
									output logic [7:0] ps2_code); 		// code received from PS/2
									
		logic [1:0] sync_ffs;    //synchronizer flip-flops for PS/2 signals
		logic ps2_clk_int;       //debounced clock signal from PS/2 keyboard
		logic ps2_data_int;      //debounced data signal from PS/2 keyboard
		logic [10:0] ps2_word;   //stores the ps2 data word
		logic error;        		//validate parity, start, and stop bits
		logic	[2778:0]	count_idle;   //counter to determine PS/2 is idle
		
		always_ff @(posedge clk)
			begin
				sync_ffs[0] <= ps2_clk;
				sync_ffs[1] <= ps2_data; 
			end
			
		//input clock
		//input signal to be debounced
		//debounced signal
		always_ff @(posedge clk)
			begin
				ps2_clk_int <= sync_ffs[0];
				ps2_data_int <= sync_ffs[1]; 
			end
		

		//input PS2 data
		always_ff @(negedge ps2_clk_int)
			begin
				ps2_word <= {ps2_data_int, ps2_word[10:1]};
			end

		//verify that parity, start, and stop bits are all correct
		assign error = ~ (~ps2_word[0] && ps2_word[10] && (ps2_word[9] ^ ps2_word[8] ^
        ps2_word[7] ^ ps2_word[6] ^ ps2_word[5] ^ ps2_word[4] ^ ps2_word[3] ^ 
        ps2_word[2] ^ ps2_word[1]));  
		  
		//determine if PS2 port is idle (i.e. last transaction is finished) and output result
		always_ff @ (posedge clk)
			begin
				if(ps2_clk_int == 0)	//low PS2 clock, PS/2 is active
					count_idle <= 2779'b0;	//reset idle counter
				else //PS2 clock has been high less than a half clock period (<55us)
					count_idle <= count_idle + 2779'b1; //continue counting
					
				if(count_idle == 2750 && error == 0) //idle threshold reached and no errors detected
					begin
						ps2_code_new <= 1'b1 ; //set flag that new PS/2 code is available
						ps2_code <= ps2_word[8:1];	//output new PS/2 code
					end
				else 	//PS/2 port active or error detected
					ps2_code_new <= 1'b0;	//set flag that PS/2 transaction is in progress
			end
			
endmodule
