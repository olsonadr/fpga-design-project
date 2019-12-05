module comparator #(parameter N=30)
						 (input	logic [N-1:0] a, b,
						  output	logic eq, neq, lt, lte, gt, gte, agt24h);
						  
	assign eq 	= 	(a == b);
	assign neq 	= 	(a != b);
	assign lt	=	(a < b);
	assign lte	=	(a <= b);
	assign gt	=	(a > b);
	assign gte	=	(a >= b);
	
	assign agt24h =	(a >= 24*3600);
	
endmodule