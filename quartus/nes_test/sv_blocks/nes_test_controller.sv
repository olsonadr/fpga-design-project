
module nes_test_controller (input 	logic 	nes_latch, nes_clock,
															in_A, in_B, in_START, in_SELECT,
															in_UP, in_DOWN, in_LEFT, in_RIGHT,
									 output	logic		nes_data);

	localparam NUM_BUTTONS = 8;
	logic [2:0] count = 0;

	always_ff @(posedge nes_latch, posedge nes_clock)
		begin
			if (nes_latch)
				begin
					count = 0;
				end
			else if (nes_clock)
				begin
					count = count + 1;
				end
		end
		
	always_comb
		begin
			case(count)
				0	:	nes_data = in_A;
				1	:	nes_data = in_B;
				2	:	nes_data = in_START;
				3	:	nes_data = in_SELECT;
				4	:	nes_data = in_UP;
				5	:	nes_data = in_DOWN;
				6	:	nes_data = in_LEFT;
				7	:	nes_data = in_RIGHT;
			endcase
		end

endmodule