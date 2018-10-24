module probador(			        input clk4f,
						input 		 clk2f,
						input 		 clkf,
						input [8:0] 	 data0,
						input [8:0] 	 data1,
						input [8:0] 	 data2,
						input [8:0] 	 data3,
						input [8:0] 	 data0E,
						input [8:0] 	 data1E,
						input [8:0] 	 data2E,
						input [8:0] 	 data3E,
						output reg [8:0] paralelo0,
						output reg [8:0] paralelo1,
						output reg [8:0] paralelo2,
						output reg [8:0] paralelo3,
						output reg 	 reset,
						output reg 	 clk16
						);

initial clk16 <=0;
always begin
	#100 clk16 <= ~clk16;
end

initial begin
	$dumpfile("phy.vcd");
	$dumpvars;

	reset = 1'b0;


	repeat (1) begin
	@(posedge clkf);
	reset<= 1'b1;
	paralelo0 <= 9'b111111111;//$FF valido
	paralelo1 <= 9'b111110101;//$F5 valido
	paralelo2 <= 9'b111111010;//$FA valido
	paralelo3 <= 9'b111110100;//$F4 valido
	end

	repeat (1) begin
	@(posedge clkf);
		paralelo0 <= 9'b011111111;//$FF invalido
		paralelo1 <= 9'b011111111;//$FF invalido
		paralelo2 <= 9'b111111111;//$FF valido
		paralelo3 <= 9'b001010101;//$55 invalido
	end

	repeat (1) begin
	@(posedge clkf);
		paralelo0 <= 9'b111111110;//$FE valido
		paralelo1 <= 9'b111111101;//$FD valido
		paralelo2 <= 9'b111111011;//$FB valido
		paralelo3 <= 9'b111111111;//$FF valido
	end

	repeat (1) begin
	@(posedge clkf);
		paralelo0 <= 9'b101010101;//$55 valido
		paralelo1 <= 9'b101010101;//$55 valido
		paralelo2 <= 9'b101010101;//$55 valido
		paralelo3 <= 9'b101010101;//$55 valido
	end

	repeat(4) begin
	@(posedge clkf);

	end

	$finish;
end

endmodule
