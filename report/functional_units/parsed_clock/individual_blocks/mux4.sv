// mux4 module

module mux4 #(parameter IN_WIDTH = 1)							// Width of each input option

				 (input  logic 	[3:0] [IN_WIDTH-1:0] in,  	// 4, 4-bit inputs (select 00, 01, 10, 11 respectively)
				  input  logic  [1:0] sel,  						// input sel that selects between inputs
				 
              output logic 	[IN_WIDTH-1:0] out); 		// 4-bit output based on input sel
 
   // Whenever an input or select changes, reassign output
   always @ (in or sel) begin
	
			out <= in[sel];
			
   end
	
endmodule