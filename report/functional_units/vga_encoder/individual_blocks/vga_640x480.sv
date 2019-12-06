
module vga_640x480	(input  logic clock_25, reset_frame,
						    output logic h_sync, v_sync, h_display, v_display);
		
		// Parameters
		localparam line 	= 800; 	// complete line
		localparam screen = 525; 	// complete screen
		
		localparam h_front_porch 	= 16;
		localparam h_sync_dur 		= 96;
		localparam h_back_porch 	= 48;
		localparam h_active_dur 	= 640;
		
		localparam v_front_porch 	= 10;
		localparam v_sync_dur 		= 2;
		localparam v_back_porch 	= 33;
		localparam v_active_dur 	= 480;
		
		localparam h_sync_start 	= h_front_porch; // time h sync starts (after)
		localparam h_sync_end 		= h_front_porch + h_sync_dur; // time h sync ends (after)
		localparam h_active_start 	= h_front_porch + h_sync_dur + h_back_porch;
		
		localparam v_sync_start 	= v_front_porch; // time h sync starts (after)
		localparam v_sync_end 		= v_front_porch + v_sync_dur; // time h sync ends (after)
		localparam v_active_start	= v_front_porch + v_sync_dur + v_back_porch;
		
		reg [9:0] h_count; // current column
		reg [9:0] v_count; // current row
		
		
		// Sync Signals
		assign h_sync = ~( (h_count >= h_sync_start) && (h_count < h_sync_end) );
		assign v_sync = ~( (v_count >= v_sync_start) && (v_count < v_sync_end) );
		
		
		// Display Signal - when pixels can display
		assign h_display = h_count >= h_active_start;
		assign v_display = v_count >= v_active_start;
		
		
		// Flip flop for incrementing
		always_ff @(posedge clock_25)
		begin
			
			if (clock_25)
			begin
				v_count <= (v_count >= screen) ? 0 : ((h_count >= line) ? v_count + 1: v_count);
				h_count <= (clock_25 && (h_count >= line | v_count >= screen)) ? 0 : h_count + 1;
			end
			
			
//			if (clock_25 || reset_frame)
//				begin
//					if (h_count >= line) // end of line
//						begin
//							h_count = 0;
//							v_count = v_count + 1;
//						end
//					else
//						begin
//							h_count = h_count + 1;
//							v_count = v_count;
//						end
//
//					if (v_count >= screen || reset_frame) // end of screen or reset
//						begin
//							h_count = 0;
//							v_count = 0;
//						end
//				end
				
		end
		
endmodule
