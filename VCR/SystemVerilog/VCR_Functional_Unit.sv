//Functional Unit for vcr decoder
module VCR_Functional_Unit(input logic clk, //input clock
									input logic IR, //input vcr signal
									output logic[6:0] displayValue); //out value from seven segment display
			
	logic [3:0] temp_out; //temporarily holds the output of the vcr_decoder module
	logic [6:0] tempDisplayValue; //temporarily holds the output of the DisplayDecoder module
	logic displayON = 0; //indicates the vcr_decoder module is outputting a value when 1
			
	//VCR Decoder Module		
	vcr_decoder vcr(
						.clk_10KHz(clk),
						.IR(IR),
						.outputting(displayON),
						.vcr_out(temp_out)
						);
	
	//Display Decoder Module
	DisplayDecoder display(
								.data(temp_out),
								.segments(tempDisplayValue)
								);
	
	//output will update anytime the output value changes
	always_comb
		begin
			if(displayON)
				displayValue = tempDisplayValue;
		end

endmodule
