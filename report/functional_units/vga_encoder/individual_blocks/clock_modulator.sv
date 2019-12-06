module clock_modulator (input  logic clock_in,
								output logic clock_out);
								
		logic count = 0;
		
		always_ff @(posedge clock_in)
		begin
			if (clock_in)		count <= count+1;
		end
		
		always_comb
		begin
			if (count == 1)	clock_out = 1;
			else					clock_out = 0;
		end
			
endmodule