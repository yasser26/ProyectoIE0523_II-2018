`timescale 1ns / 100ps
`include "ClkGenerator.v"
`include "phy_rx.v"
`include "probador.v"
`include "cmos_cells.v"
`include "phy_rxEstru.v"


module testBench;

	wire reset_L, clkf, clk4f, clk2f, clk16f;
	wire [8:0] data0, data1, data2, data3;
	wire [8:0] data0E, data1E, data2E, data3E;
	wire [1:0] serial;


	//Instancia modulo ClkGenerator
	ClkGenerator clkGenerator( 	.clk16f	(clk16f),
				        							.reset_L(reset_L),
				        							.clk4f(clk4f),
															.clk2f(clk2f),
															.clkf(clkf));


	phy_rx phyRXCondu (	.clk_f(clkf),
									.clk_2f(clk2f),
									.clk_4f(clk4f),
									.clk_16(clk16f),
									.reset(reset_L),
									.serial(serial),
									.data_0(data0),
									.data_1(data1),
									.data_2(data2),
									.data_3(data3));


	phy_rxEstru phyRXEstru (	.clk_f(clkf),
									.clk_2f(clk2f),
									.clk_4f(clk4f),
									.clk_16(clk16f),
									.reset(reset_L),
									.serial(serial),
									.data_0(data0E),
									.data_1(data1E),
									.data_2(data2E),
									.data_3(data3E)); 



	//Instancia probador
	probador probador( 	.clk4f(clk4f),
											.clk2f(clk2f),
											.clkf(clkf),
											.data0(data0),
											.data1(data1),
											.data2(data2),
											.data3(data3),
											.data0E(data0E),
											.data1E(data1E),
											.data2E(data2E),
											.data3E(data3E),
											.reset_L(reset_L),
											.clk16f(clk16f),
											.serial(serial));

endmodule
