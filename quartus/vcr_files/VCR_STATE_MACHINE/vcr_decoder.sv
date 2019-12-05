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


//Seven Segment Display Decoder
module DisplayDecoder(input logic [3:0] data,
								output logic [6:0]segments);							
	always_comb
		case(data)		//   abc_defg
			0:	segments = 7'b100_0000;
			1: segments = 7'b111_1001;
			2: segments = 7'b010_0100;
			3: segments = 7'b011_0000;
			4: segments = 7'b001_1001;
			5: segments = 7'b001_0010;
			6: segments = 7'b000_0010;
			7: segments = 7'b111_1000;
			8: segments = 7'b000_0000;
			9: segments = 7'b001_1000;
			default: segments = 7'b111_1111;
		endcase
endmodule


//VCR Decoder Module
module vcr_decoder(input logic clk_10KHz, //input clock with 10KHz frequency
						input logic IR, //input IR signal from VCR remote
						output logic outputting,
						output logic[3:0] vcr_out); //output value for vcr signal
						
	//declare states
	typedef enum logic [2:0] {IDLE, C1, C2, READ, PUSH} statetype;
	statetype state, nextstate;
	
	//Internal 
	logic stateReset = 0; //value to reset state machine to IDLE
	logic readControl = 0; //TRUE when reading a control signal
	logic [8:0]controlCounter = 0; //counter for length of control signal
	logic controlLength = 0; //length of control signal
	logic readyToRead = 0; //set to 1 to activate the ReadState state machine
	logic outputReady = 0; //set to 1 when ReadState is ready to output 32 bit value
	logic [31:0] tempOutput = 0; //gets output from ReadState state machine module
	logic [3:0] temp_vcr_out = 0; //gets output from SignalDecoder module
	
	logic init = 1; //used to initialize state to IDLE
	
	
	//READ State Machine
	/*This module reads each pulse of the IR signal and outputs a 32-bit value when 
	32 bits have been read into the shift register*/
	ReadState reader(
							.clk(clk_10KHz),
							.IR(IR),
							.start(readyToRead),
							.pushOutput(outputReady),
							.outputValue(tempOutput)
							);
					
	//Signal Decoder		
	//takes 32-bit value and converts it to a 4 bit value between 0 and 15
	SignalDecoder decoder(
									.signal(tempOutput),
									.value(temp_vcr_out)
								);
	
	
	//State register
	always_ff@(posedge clk_10KHz, posedge stateReset)
		begin
			
			//if reading a control signal, increment counter with the clock to count length of signal
			if(readControl) 
				controlCounter <= controlCounter + 1;
			else
				controlCounter <= 0;
			
			//Then either reset the state to IDLE or move to the next state
			if(stateReset || init) 
				state <= IDLE; //set state to IDLE
			else
				state <= nextstate;
				
		end
	
	
	//next state logic
	always_comb 
		begin
			case(state)
				IDLE:
					begin
						init = 0;
						outputReady = 0;
						readyToRead = 0;
						if(!IR) //IR signal goes low for first control signal
							nextstate = C1;
						else //otherwise just stay in IDLE
							nextstate = IDLE;
							
						readControl = 0; //Not reading control signal
					end
				C1:
					begin
						readControl = 1; //start reading the control signal
						readyToRead = 0;
						if(IR) begin //IR goes high signalling end of first control signal and start of second
							if(controlCounter > 80 && controlCounter < 110) begin //good control signal
								nextstate = C2; //move to next control state
								readControl = 0; //No longer reading control signal
							end
							else begin
								nextstate = IDLE; //if bad control signal, move back to IDLE
								readControl = 0; //No longer reading control signal
							end
						end
						else //otherwise just stay in C1
							nextstate = C1;
					end
				C2:
					begin
						readControl = 1; //start reading control signal
						readyToRead = 0;
						if(!IR) begin //IR signal goes low signalling end of second control signal
							if(controlCounter > 35 && controlCounter < 50) begin
								nextstate = READ;
								readControl = 0;
							end	
							else begin
								nextstate = IDLE;
								readControl = 0;
							end
						end
						else
							nextstate = C2;
					end
				READ:
					begin
						readyToRead = 1; //activate ReadState state machine module
						if(outputReady) //when ready to output move to PUSH state
							nextstate = PUSH;
						else 
							nextstate <= READ; //Otherwise just stay in READ
					end
				PUSH:
					begin
						outputting = 1;
						vcr_out = temp_vcr_out; //Set output of vcr_decoder module
					end
				default:
					begin
						nextstate = IDLE; //default state is IDLE
					end
			endcase 
		end
	
endmodule






//////////////////////
//READ State Machine//
/////////////////////
module ReadState(input logic clk, 
					  input logic IR, //VCR signal
					  input logic start, //input signal to activate the ReadState state machine module
					  output logic pushOutput, //output signal that a full 32 bit value is ready to be output
					  output logic [31:0] outputValue); //32 bit output value
					  
	//declare states
	typedef enum logic [2:0] {Reading, Processing, Waiting, IDLE, Done} statetype;
	statetype state, nextstate;
	
	//Internal
	logic readReset = 0; //resets state machine to waiting
	logic readSignal = 0; //TRUE when reading a logic HIGH
	logic [8:0]signalCounter = 0; //Measures length of HIGH signal
	logic value = 0; //value 1 or 0 based on HIGH signal length
	logic shiftValue = 0; //when TRUE a new bit will be shifted into the shift register
	logic [8:0]bitCounter = 0; //counts the number of bits being read
	logic [31:0] tempSignalValue; //will temporarily store the output value
	logic [31:0] signalValue; //stores shift register values
	logic init = 1; //used to set the initial state to IDLE
	
	//Shift Register
	ShiftRegister shiftReg(
									.clk(shiftValue), //shift register clock is shiftValue
									.reset(readReset),	//reset shift register
									.sin(value), //shifts current signal value in
									.q(signalValue) //output is 32 bits value for entire signal
									);
									
	
	//State Register
	always_ff@(posedge clk, posedge readReset, posedge shiftValue)
		begin
		
			if(start) begin
					
				//if reading signal, increment clock
				if(readSignal) 
					signalCounter <= signalCounter + 1;
				else
					signalCounter <= 0;
			
				//If bit is being added shift register, increment the bit counter
				if(shiftValue)
					bitCounter <= bitCounter + 1;
					
				//Then either reset, or move to the next state
				if(readReset || init)
					state <= IDLE;
				else
					state <= nextstate;
			end
			
		end
	
	//Next State Logic
	always_comb
		begin
			case(state)
				IDLE: //Initial state where no IR is being read
					begin
						init = 0;
						pushOutput = 0;
						readSignal = 0;
						readReset = 0;
						shiftValue = 0;
					
						if(IR) //when IR goes high, switch to reading state
							nextstate <= Reading;
						else
							nextstate <= IDLE;
					end
				Waiting: //Low signal between processing and Reading
					begin
						shiftValue = 0;
						readReset = 0; //while waiting, not resetting read signal
						readSignal = 0; //while waiting, not reading signal
						
						if(bitCounter == 64)
							nextstate <= Done;
						else if(IR) 
							nextstate <= Reading;
						else
							nextstate <= Waiting;
					end
				Reading:
					begin
						readSignal = 1; //counting signal length
						
						if(!IR) //when IR signal goes low again, move to processing state
							nextstate <= Processing;
						else if(IR)
							nextstate <= Reading;
						else
							nextstate <= IDLE;
					end
				Processing:
					begin	
						if(signalCounter <= 18 && signalCounter > 12) begin //logic 1
							value = 1; //store value
							shiftValue = 1; //shift into register
							nextstate <= Waiting;
						end
						else if(signalCounter <= 9 && signalCounter >= 1) begin //logic 0
							value = 0; //store value
							shiftValue = 1; //shift into register
							nextstate <= Waiting;
						end
						else begin
							readReset = 1;
							nextstate <= IDLE;
						end
					end
				Done:
					begin
						tempSignalValue = signalValue;
						outputValue = tempSignalValue;
						pushOutput = 1;
					end
			endcase
		end
		
endmodule 





/////////////////////////
//Shift Register Module//
/////////////////////////
module ShiftRegister #(parameter N=32)
							(input logic clk,
							input logic reset, load,
							input logic sin,
							input logic [N-1:0]d,
							output logic [N-1:0]q,
							output logic sout);
							
	always_ff@(posedge clk, posedge reset)
		if(reset) q <= 0;
		else if(load) q <= d;
		else q <= {q[N-2:0], sin};
		
	assign sout = q[N-1];

endmodule 



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

