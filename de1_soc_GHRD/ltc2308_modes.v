
module ltc2308_modes (
	input clk_50,
	input mode,
	
	input miso,
	output reg sck  = 1'b0,
	output reg cs   = 1'b1,
	output reg mosi = 1'b0,
	
	output reg[11:0] reading0 = 12'b0,
	output reg[11:0] reading1 = 12'b0,
	output reg[11:0] reading2 = 12'b0
);

	parameter counter_max = 6'd49;
	reg[6:0] counter = counter_max;

	reg[11:0] mosi_sreg = 12'b0;
	reg[10:0] miso_sreg = 11'b0;
	
	reg[1:0] channel = 2'b00;
	reg[1:0] channel_previous = 2'b00;


	// -------- CREATE 25MHZ CLOCK --------
	always @ (posedge clk_50)
		sck <= ~sck;


	// -------- COUNTER LOGIC --------
	always @ (posedge sck)
		if (counter == 6'd0)
			counter <= counter_max;
		else
			counter <= counter - 1'd1;

			
	// -------- ACQUIRE PERIOD LOGIC -------- 
	// --------  ( COUNTER <= 11 )   -------- 

	// Send MOSI_SREG value to SDI
	always @ (posedge sck)
		mosi <= mosi_sreg[11];

	// Set CS low when in aquire period
	always @ (negedge sck)
		if (counter > 6'd11)
			cs = 1'b1;
		else
			cs = 1'b0;


	// Shift values of MOSI_SREG during aquire period
	always @ (negedge sck)
		if (!cs)
			mosi_sreg <= {mosi_sreg[10:0],1'b0};
		else
			mosi_sreg <= {1'b1,channel[0],1'b0,channel[1],8'b10000000};
		
	// Shift in new value from SDO into MISO_SREG
	// Also output final value to READING at end of the aquire period
	always @ (posedge sck)
		if (!cs && counter == 4'h0) begin
			case (channel_previous)
				2'b00: reading0 <= {miso_sreg[10:0],miso};
				2'b01: reading1 <= {miso_sreg[10:0],miso};
				2'b10: reading2 <= {miso_sreg[10:0],miso};
			endcase
			
			channel_previous <= channel;
		end
		else if (!cs)
			miso_sreg <= {miso_sreg[9:0],miso};
		else begin
			miso_sreg <= 11'd0;
			
			if (mode == 1'b1)
				channel <= 2'b10;
			else
				channel[1:0] <= {1'b0,~channel_previous[0]};
		end
				
endmodule
