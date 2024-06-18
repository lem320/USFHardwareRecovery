module ltc2308 (clk_50, sck, cs, mosi, miso, reading0, reading1);

	input clk_50, miso;

	output reg sck, mosi, cs;
	output reg[11:0] reading0, reading1;

	initial sck = 1'b0;
	initial cs = 1'b1;
	initial mosi = 1'b0;
	initial reading0 = 12'd0;
	initial reading1 = 12'd0;

	parameter counter_max = 6'd49;
	reg[6:0] counter = counter_max;

	reg[11:0] mosi_sreg;
	reg[10:0] miso_sreg;
	
	reg channel = 0;


	generate

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
		// --------   ( COUNTER > 11 )   -------- 

//		parameter write_message = 12'b100010000000;

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
				mosi_sreg <= {1'b1,channel,10'b0010000000};
			
		// Shift in new value from SDO into MISO_SREG
		// Also output final value to READING at end of the aquire period
		always @ (posedge sck)
			if (!cs && counter == 4'h0) begin
				case (channel)
					1'b0: reading1 <= {miso_sreg[10:0],miso};
					1'b1: reading0 <= {miso_sreg[10:0],miso};
				endcase
				channel = ~channel;
			end
			else if (!cs)
				miso_sreg <= {miso_sreg[9:0],miso};
			else
				miso_sreg <= 11'd0;

	endgenerate

endmodule