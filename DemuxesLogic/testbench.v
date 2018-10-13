`timescale 1ns / 100ps
`include "ClkGenerator.v"
`include "demux.v"
`include "probador.v"
`include "DemuxesEstructural.v"
`include "cmos_cells.v"

module testBench;
	
	wire reset_L, clkf, clk4f, clk2f, clk16f;
	wire [8:0] data0, data1, data2, data3, inEtapaL2;
	wire [8:0] data0e, data1e, data2e, data3e;
	

	//Instancia modulo ClkGenerator
	ClkGenerator clkGenerator( 	.clk16f	(clk16f),
				        .reset_L(reset_L),
				        .clk4f(clk4f),
					.clk2f(clk2f),
					.clkf(clkf));


	demux demux(		.clk_f(clkf),
          			.clk_2f(clk2f),
	  			.clk_4f(clk4f),
	  			.reset(reset_L),
	  			.data0(data0),
	  			.data1(data1),
	  			.data2(data2),
	  			.data3(data3),
	  			.inEtapaL2(inEtapaL2));

	demuxEstructural demuxEstru(		.clk_f(clkf),
          					.clk_2f(clk2f),
	  					.clk_4f(clk4f),
	  					.reset(reset_L),
	  					.data0(data0e),
	  					.data1(data1e),
	  					.data2(data2e),
	  					.data3(data3e),
	  					.inEtapaL2(inEtapaL2));

	

	//Instancia probador
	probador probador( 	.clk16f	(clk16f),
				.clk4f	(clk4f),
				.clk2f	(clk2f),
				.clkf 	(clkf),
				.reset_L(reset_L),
				.data0(data0),
  				.data1(data1),
  				.data2(data2),
  				.data3(data3),
				.data0E(data0e),
  				.data1E(data1e),
  				.data2E(data2e),
  				.data3E(data3e),
				.inEtapaL2(inEtapaL2));

endmodule
