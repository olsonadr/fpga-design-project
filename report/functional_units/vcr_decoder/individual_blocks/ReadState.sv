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







