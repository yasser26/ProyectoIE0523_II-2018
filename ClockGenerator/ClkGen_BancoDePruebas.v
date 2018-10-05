`timescale 1ns / 100ps
`include "ClkGenerator.v"
`include "ClkGen_Probador.v"

module Test_Bench;

	//Instancia modulo ClkGenerator
	ClkGenerator	 CG 	( 	.clk16f	(clk16f),
								.reset_L(reset_L),
								.clk4f	(clk4f),
								.clk2f	(clk2f),
								.clkf 	(clkf)
	);

	//Instancia probador
	ClkGen_Probador	 CG_Probador( 	.clk16f	(clk16f),
									.reset_L(reset_L),
									.clk4f	(clk4f),
									.clk2f	(clk2f),
									.clkf 	(clkf)
	);

endmodule
