// mux2 module

module mux2 #(parameter IN_WIDTH = 7)							// Width of each input option

				 (input  logic  [1:0] [IN_WIDTH-1:0] in,  	// 2, (IN_WIDTH-1)-bit inputs (select 0, 1 respectively)
				  input  logic  sel,  								// input sel that selects between inputs
				 
              output logic 	[IN_WIDTH-1:0] out); 		// (IN_WIDTH-1)-bit output based on input sel
 
   // Whenever an input or select changes, reassign output
   always @ (in or sel) begin
	
			out <= in[sel];
			
   end
	
endmodule