module adc_wrapper (clk, reset, ADC_SCLK, ADC_CS_N, ADC_DOUT, ADC_DIN, s1);


	input clk, reset;
	input ADC_DOUT;
	output ADC_SCLK, ADC_CS_N, ADC_DIN;
	
	output wire [31:0] s1;
	wire [11:0] reading0, reading1;
	
//	assign s1 = {4'b0,reading1,4'b0,reading0};
	
	reg[15:0] tmp = 16'b0;
	assign s1 = {16'b0,tmp};

	
	ltc2308 ADC2 (
		.clk_50(clk),
		.sck(ADC_SCLK),
		.cs(ADC_CS_N),
		.mosi(ADC_DIN),
		.miso(ADC_DOUT),
		.reading0(reading0),
		.reading1(reading1)
	);
	
	always @ (posedge ADC_CS_N)
		tmp <= tmp + 1'b1;

endmodule