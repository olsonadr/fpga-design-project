//////////////////////////////////
///// Signal Decoder /////////////
//////////////////////////////////
module SignalDecoder(input logic [31:0]signal,
							output logic [3:0] value);
	always_comb						
		case(signal)
			32'h916E926D : value = 0;
			32'h916E02FD : value = 1;
			32'h916E827D : value = 2;
			32'h916E62BD : value = 3;
			32'h916EC23D : value = 4;
			32'h916E22DD : value = 5;
			32'h916EA25D : value = 6;
			32'h916E629D : value = 7;
			32'h916EE21D : value = 8;
			32'h916E12ED : value = 9;
			default : value = 15;
		endcase 
endmodule 

