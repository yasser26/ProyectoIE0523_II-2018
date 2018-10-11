`timescale 100ns / 100ps
`include "ClkGenerator.v"
`include "ParaleloSerial.v"
`include "ParaleloSerialEstructural.v"
`include "ParaleloSerial_Probador.v"
`include "cmos_cells.v"

module Test_Bench;

	wire [8:0] paralelo;
	wire [1:0] serialCond;
	wire [1:0] serialEst;
	wire clk16f, clk4f, clk2f, clkf, reset_L,reset;

	//Instancia modulo ClkGenerator
	ClkGenerator	 			ClkGen 			( 	.clk16f	(clk16f),
													.reset_L(reset_L),
													.clk4f	(clk4f),
													.clk2f	(clk2f),
													.clkf 	(clkf)
	);

	//Instancia modulo conductual Paralelo Serial
	ParaleloSerial	 			PSConductual	(	.clk16f		(clk16f),
													.clk4f 		(clk4f),
													.reset		(reset),
													.paralelo	(paralelo),
													.serial 	(serialCond),
													.reset_L	(reset_L)
	);

	//Instancia modulo estructural Paralelo Serial
	ParaleloSerialEstructural	 PSEstructural	(	.clk16f		(clk16f),
													.clk4f 		(clk4f),
													.reset		(reset),
													.paralelo	(paralelo),
													.serial 	(serialEst),
													.reset_L	(reset_L)
	);



	//Instancia probador
	ParaleloSerial_Probador	 PS_Probador 		( 	.serialcond		(serialCond),
													.serialest 		(serialEst),
													.paralelo		(paralelo),
													.reset			(reset),
													.reset_L 		(reset_L),
													.clk4f			(clk4f),
													.clk16f			(clk16f)
	);

endmodule
