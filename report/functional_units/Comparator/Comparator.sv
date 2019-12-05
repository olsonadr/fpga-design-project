module Comparator #(parameter n = 23, m = 5000)
						(input logic [n-1:0] a,
						output logic eq);
						
	
									
	assign eq = (a == m);
endmodule 