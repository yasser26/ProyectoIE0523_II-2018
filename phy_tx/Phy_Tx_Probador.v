module Phy_Tx_Probador(	
						input 		[1:0]	serialCond,
						input 		[1:0]	serialEst,
						input clkf,
						input clk2f,
						input clk4f,
						output reg [8:0] paralelo0,
						output reg [8:0] paralelo1,
						output reg [8:0] paralelo2,
						output reg [8:0] paralelo3,
						output reg reset,
						output reg reset_L,
						output reg clk16f
						);




initial clk16f <=0;
always begin
	#100 clk16f <= ~clk16f;
end

initial begin
	$dumpfile("Phy_tx.vcd");
	$dumpvars;

	reset = 1'b1;
	reset_L = 1'b0;


	repeat (1) begin
	@(posedge clkf);
	reset_L <= 1'b1;
	paralelo0 <= 9'b111111111;//$FF valido
	paralelo1 <= 9'b111110101;//$F5 valido
	paralelo2 <= 9'b111111010;//$FA valido
	paralelo3 <= 9'b111110100;//$F4 valido
	reset <= 1'b0;
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
		paralelo0 <= 9'b111111111;//$FF valido
		paralelo1 <= 9'b111111111;//$FF valido
		paralelo2 <= 9'b111111111;//$FF valido
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