module usf_top (
	clk, reset, en,
	sck, cs, dout, din,
	fifo_in_writedata, fifo_in_write,
	gpio, led
);

	`include "functions.sv"
	
	input clk, reset, en;
	
	input dout;
	output wire sck, cs, din;
	
	output reg[31:0] fifo_in_writedata = 32'b0;
	output reg fifo_in_write = 1'b0;
	
	output wire[3:0] gpio;
	output wire[9:0] led;
	

	// Breakout ADC connections for scope readings
	assign gpio[0] = sck;
	assign gpio[1] = cs;
	assign gpio[2] = din;
	assign gpio[3] = dout;

	
	// Set up ADC
	wire[11:0] reading0, reading1;
	ltc2308 ADC (
		.clk_50(clk),
		
		.sck(sck),
		.cs(cs),
		.mosi(din),
		.miso(dout),
		
		.reading0(reading0),
		.reading1(reading1)
	);
	
	reg half_cs = 1'b1;
	always @ (posedge cs)
		half_cs = ~half_cs;

	
	// Set up ROM
	reg[14:0] rom_address = 0;
	wire[11:0] rom_q;
	rom_ideal ROM (
		.address(rom_address),
		.data(rom_q)
	);
	always @ (posedge half_cs)
		rom_address <= rom_address + 1'b1;
	
	
	// Set what data is used (Simulation or Practical use)
	wire[11:0] data = rom_q;    	// FOR SIMULATION
//	wire[11:0] data = reading0; 	// FOR PRACTICAL USE

//	wire[11:0] data2 = rom_q;    	// FOR SIMULATION
	wire[11:0] data2 = reading1;	// FOR PRACTICAL USE (INPUT SIGNAL)
//	wire[11:0] data2 = reading0;	// FOR PRACTICAL USE (MODULO SIGNAL)
	
	
	// Set up input FIFOs
	wire input_fifo_empty;
	wire [11:0] input_fifo_q;
	reg input_fifo_rdreq = 0;
	reg input_fifo_wdreq = 0;
	INPUT_FIFO FIFO1 (
		.clock(clk),
		.data(data),
		.rdreq(input_fifo_rdreq),
		.wrreq(input_fifo_wdreq),
		.q(input_fifo_q),
		.empty(input_fifo_empty)
	);
	
	wire input_fifo_empty2;
	wire [11:0] input_fifo_q2;
	INPUT_FIFO FIFO2 (
		.clock(clk),
		.data(data2),
		.rdreq(input_fifo_rdreq),
		.wrreq(input_fifo_wdreq),
		.q(input_fifo_q2),
		.empty(input_fifo_empty2)
	);
	
	// Write to FIFOs - new_cycle may not be needed
	reg new_cycle = 1'b1;
	always @ (posedge clk)
		if (en)
			if (!input_fifo_wdreq && cs && new_cycle && half_cs==1'b0) begin
				input_fifo_wdreq <= 1'b1;
			end
			else if (input_fifo_wdreq && cs && new_cycle && half_cs==1'b0) begin
				input_fifo_wdreq <= 1'b0;
				new_cycle <= 1'b0;
			end
			else if (!cs && !new_cycle)
				new_cycle <= 1'b1;
	
	
	// Initialise buffers and other variables
	reg[ADC_RES-1:0] buffer_in [J+EXTRA_SAMPLES:0];
	reg[ADC_RES-1:0] buffer_in2 [J+EXTRA_SAMPLES:0];
	reg[OUT_RES-1:0] buffer_out [J:0];

	reg[9:0] buffer_in_index = 0;
	reg[9:0] buffer_out_index = J+1;
	
	reg[15:0] usf_recovery_delay = 0;	
	reg k_found_local = 1'b0;	

	integer i;
	initial begin
		for (i=0; i<=J+EXTRA_SAMPLES; i=i+1) begin
			buffer_in[i] = 0;
			buffer_in2[i] = 0;
		end
		for (i=J+1; i<=J+EXTRA_SAMPLES; i=i+1)
			buffer_in[i] = 0;
	end
	
	// Set up USF recovery
	reg usf_recovery_en = 1'b0;
	wire[OUT_RES-1:0] usf_recovery_out [J:0];
	wire k_found;
	usf_recovery_multi USF (
		.clk(clk),
		.reset(!en),
		.en(usf_recovery_en),
		.in(buffer_in),
		.out(usf_recovery_out),
		.k_found(k_found)
	);
	
	
	
	always @ (negedge clk) begin
	
		if (en) begin
		
			// Read from FIFO when required
			if (buffer_in_index < J+1+EXTRA_SAMPLES) begin
				input_fifo_rdreq <= !input_fifo_empty;
			end	

				
			// Write when FIFO Q is ready
			if (input_fifo_rdreq && input_fifo_empty && buffer_in_index < J+1+EXTRA_SAMPLES) begin
				buffer_in[buffer_in_index] <= input_fifo_q;
				buffer_in2[buffer_in_index] <= input_fifo_q2;
				buffer_in_index <= buffer_in_index + 1'b1;
			end
			
			
			// Check if input buffer is full
			// If so, begin USF recovery
			else if (buffer_in_index == J+1+EXTRA_SAMPLES) begin
				usf_recovery_en <= usf_recovery_delay == 0;
				
				// Update local k_found
				if (usf_recovery_delay == 0)
					k_found_local <= k_found;
			
				// Wait for USF recovery to finish
				if (usf_recovery_delay <= GET_USF_RECOVERY_DELAY(k_found_local))
					usf_recovery_delay <= usf_recovery_delay + 1'b1;
				
				// When USF recovery finishes, write recovered output to output buffer
				else begin
					// Write extra samples to beginning of input buffer
					for (i=0; i<EXTRA_SAMPLES; i=i+1)
						buffer_in[i] <= buffer_in[J+1+i];
											
					for (i=0; i<J+1; i=i+1)
						buffer_out[i] <= usf_recovery_out[i];
					
					usf_recovery_delay <= 0;
					k_found_local <= k_found;
					buffer_in_index <= EXTRA_SAMPLES;
					buffer_out_index <= 0;
				end
			end

			// Write output buffer samples to output FIFO
			if (buffer_out_index < J+1) begin
					fifo_in_write <= 1'b1;
//					fifo_in_writedata <= {4'd0,buffer_in2[buffer_out_index],buffer_out[buffer_out_index]};				// FOR PRACTICAL USE
					fifo_in_writedata <= {{(16){buffer_out[buffer_out_index][15]}},buffer_out[buffer_out_index]};	// FOR SIMULATION
					buffer_out_index <= buffer_out_index + 1'b1;
					
					// Move extra samples to beginning of buffer
					if (buffer_out_index == J) begin
						for (i=0; i<EXTRA_SAMPLES; i=i+1) begin
							buffer_in2[i] <= buffer_in2[J+1+i];
						end
					end
				end
			else
				fifo_in_write <= 1'b0;
		
		end
		
		// When en LOW, reset values
		else begin
			for (i=0; i<=J; i=i+1) begin
				buffer_out[i] <= 0;
			end
			buffer_in_index <= 0;
			buffer_out_index <= J+1;
			input_fifo_rdreq <= !input_fifo_empty;
		end
	end
	
endmodule