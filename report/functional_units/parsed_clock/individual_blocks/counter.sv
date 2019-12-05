module counter #(parameter N=30)
					 (input  logic clk, reset, enable,
					  output logic [N-1:0]	q);
	
	always_ff@(posedge clk, posedge reset)
		begin
			if(reset) 			q <= 0;
			else if(enable)	q <= q+1;
		end
		
endmodule