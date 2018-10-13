`timescale 1ns / 100ps
`include "ClkGenerator.v"
`include "phy_tx.v"
`include "probador.v"
`include "cmos_cells.v"

module Test_Bench;
	
	wire reset_L, clkf, clk4f, clk2f;
	wire [8:0] data0, data1, data2, data3, outEtapaL2;
	

	//Instancia modulo ClkGenerator
	ClkGenerator	 CG 	( 	.clk16f	(clk16f),
				        .reset_L(reset_L),
				        .clk4f(clk4f),
					.clk2f(clk2f),
					.clkf(clkf)
	);


phy_tx tx(.clk_f(clkf),
          .clk_2f(clk2f),
	  .clk_4f(clk4f),
	  .reset(reset_L),
	  .data0(data0),
	  .data1(data1),
	  .data2(data2),
	  .data3(data3),
	  .outEtapaL2(outEtapaL2));


	//Instancia probador
	ClkGen_Probador	 CG_Probador( 	.clk16f	(clk16f),
									.clk4f	(clk4f),
									.clk2f	(clk2f),
									.clkf 	(clkf),
									.reset_L(reset_L),
									.clk4fe	(clk4fest),
									.clk2fe	(clk2fest),
									.clkfe (clkfest),
									.data0(data0),
	  								.data1(data1),
	  								.data2(data2),
	  								.data3(data3),
									.outEtapaL2(outEtapaL2)

	);

endmodule
