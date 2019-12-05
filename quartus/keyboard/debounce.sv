module debounce #(counter_size = 19)
						(input logic clk,     //input clock
						input logic button,	//input signal to be debounced
						output logic result);  //debounced signal 
						
	logic [1:0] flipflops;   //input flip flops
	logic counter_set;
	logic [0:counter_size]counter_out = 0; //counter output

	always_ff @(posedge clk)
		begin
			flipflops[0] <= button;
			flipflops[1] <= flipflops[0];
			counter_set <= (flipflops[0] ^ flipflops[1]); //sync reset to zero
			if (counter_set == 1) counter_out <= 0;
			else if (counter_out[counter_size] == 1) counter_out <= counter_out + 1'b1; 
			else result <= flipflops[1];
		end
endmodule
 