`timescale 1ns / 100ps
`include "ClkGenerator.v"
`include "ClkGeneratorEstructural.v"
`include "ClkGen_Probador.v"
`include "cmos_cells.v"


module Test_Bench;

	//Instancia modulo ClkGenerator
	ClkGenerator	 CG 	( 	.clk16f	(clk16f),
								.reset_L(reset_L),
								.clk4f	(clk4f),
								.clk2f	(clk2f),
								.clkf 	(clkf)
	);

	//Instancia modulo ClkGenerator Estructural
	ClkGeneratorEstructural	 CGEst 	( 	.clk16f	(clk16f),
										.reset_L(reset_L),
										.clk4f	(clk4fest),
										.clk2f	(clk2fest),
										.clkf 	(clkfest)
	);

	//Instancia probador
	ClkGen_Probador	 CG_Probador( 	.clk16f	(clk16f),
									.clk4f	(clk4f),
									.clk2f	(clk2f),
									.clkf 	(clkf),
									.reset_L(reset_L),
									.clk4fe	(clk4fest),
									.clk2fe	(clk2fest),
									.clkfe (clkfest)

	);

endmodule
