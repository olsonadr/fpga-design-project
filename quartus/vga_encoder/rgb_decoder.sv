module rgb_decoder (input  logic [1:0] red_in,
						  input  logic [1:0] green_in,
						  input  logic [1:0] blue_in,
						  
						  output logic [3:0] red_out,
					     output	logic [3:0] green_out,
						  output logic [3:0] blue_out);
	
	always_comb
	begin
		red_out = red_in * 85;
		green_out = green_in * 85;
		blue_out = blue_in * 85;
	end
									
endmodule