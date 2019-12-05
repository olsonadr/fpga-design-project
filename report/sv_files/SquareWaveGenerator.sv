module SquareWaveGenerator(input logic clk, 
									input logic [2:0] note,
									input logic en,
									input logic reset_n,
									output logic speaker);
	
	logic tmp_clk;
             
   logic [20:0] div_cnt, max_count;
	/*initial begin 
		tmp_clk=0;
		div_cnt=0;
	end */
	
	//select correct frequency based on input note
	always_comb
		begin
			
			case (note) 
				3'b000: max_count = 95419; //C(middle)
				3'b001: max_count = 85034; //D
				3'b010: max_count = 75757; //E
				3'b011: max_count = 71428; //F
				3'b100: max_count = 63775; //G
				3'b101: max_count = 56818; //A
				3'b110: max_count = 50607; //B
				3'b111: max_count = 47800; //C
			endcase
		end	
		
   always_ff @ (posedge(clk), negedge(reset_n), posedge(en))   
		begin
			if (!reset_n) 
				begin
					tmp_clk <= 0;
					div_cnt <= 0;
				end
			else 
				begin
					if (div_cnt >= max_count) 
						begin
							tmp_clk <= ~tmp_clk; 
							div_cnt <= 21'b0; 
						end
					else
						div_cnt <= div_cnt + 1; 
				end
			if (en) speaker <= tmp_clk;
			else speaker <= 0;
		end
		

endmodule

