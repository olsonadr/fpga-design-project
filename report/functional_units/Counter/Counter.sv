module Counter #(parameter n = 23)
					(input logic clk,
					input logic reset,
					output logic [n-1:0] q);
					
	always_ff @(posedge clk, posedge reset)
		if (reset) q <= 0;
		else	q <= q+1;
endmodule
