`timescale 100ns / 100ps
`include "ClkGenerator.v"
`include "test.v"
`include "main.v"
`include "mainSynth.v"
`include "ParaleloSerial_Probador.v"
`include "cmos_cells.v"

module Test_Bench;

	wire [8:0] paralelo, serial,spEst;
	wire [1:0] serialCond;
	//wire [1:0] serialEst;
	wire clk16f, clk4f, clk2f, clkf, reset_L,reset;

	serialParalelo ser1(.clk16(clk16f) , .reset16(reset_L) ,.serial(serialCond),.outParalelo(serial));
	serialParaleloEst ser2(.clk16(clk16f) , .reset16(reset_L) ,.serial(serialCond),.outParalelo(spEst));
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

	

	//Instancia probador
	ParaleloSerial_Probador	 PS_Probador 		( 	.serialcond		(serialCond),
													//.serialest 		(serialEst),
													.paralelo		(paralelo),
													.serial			(serial),
													.spEst			(spEst),
													.reset			(reset),
													.reset_L 		(reset_L),
													.clk4f			(clk4f),
													.clk16f			(clk16f)
	);

endmodule
