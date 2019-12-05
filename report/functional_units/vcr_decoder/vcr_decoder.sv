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






