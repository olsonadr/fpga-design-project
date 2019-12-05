module decoder(input logic[7:0]a, 
					output logic [2:0] y); 
					
	always_comb 
		case(a) 
			8'h1C: y = 3'b000; 
			8'h1B: y = 3'b001; 
			8'h23: y = 3'b010; 
			8'h2B: y = 3'b011; 
			8'h1D: y = 3'b100; 
			8'h24: y = 3'b101; 
			8'h2D: y = 3'b110; 
			8'h2C: y = 3'b111; 
			default: y = 3'bxxx; 
		
		endcase 
		
endmodule