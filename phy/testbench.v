`timescale 1ns / 100ps
`include "probador.v"
`include "phy.v"
`include "phyEst.v"
`include "cmos_cells.v"
`include "ClkGenerator.v"
module testbench;
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire			clk16;			// From prob of probador.v
   wire			clk2f;			// From clk of ClkGenerator.v
   wire			clk4f;			// From clk of ClkGenerator.v
   wire			clkf;			// From clk of ClkGenerator.v

   wire [8:0]		data_0;			// From phyCond of phy.v, ...
   wire [8:0]		data_1;			// From phyCond of phy.v, ...
   wire [8:0]		data_2;			// From phyCond of phy.v, ...
   wire [8:0]		data_3;			// From phyCond of phy.v, ...

   wire [8:0]		data0;		// From phyEst of phy.v, ...
   wire [8:0]		data1;		// From phyEst of phy.v, ...
   wire [8:0]		data2;		// From phyEst of phy.v, ...
   wire [8:0]		data3;		// From phyEst of phy.v, ...

   
   wire [8:0]		paralelo0;		// From prob of probador.v
   wire [8:0]		paralelo1;		// From prob of probador.v
   wire [8:0]		paralelo2;		// From prob of probador.v
   wire [8:0]		paralelo3;		// From prob of probador.v
   wire			reset;			// From prob of probador.v
   // End of automatics
   
   phy phyCond(/*AUTOINST*/
	       // Outputs
	       .data_0			(data_0[8:0]),
	       .data_1			(data_1[8:0]),
	       .data_2			(data_2[8:0]),
	       .data_3			(data_3[8:0]),
	       // Inputs
	       .clk16			(clk16),
	       .clk4f			(clk4f),
	       .clk2f			(clk2f),
	       .clkf			(clkf),
	       .reset			(reset),
	       .paralelo0		(paralelo0[8:0]),
	       .paralelo1		(paralelo1[8:0]),
	       .paralelo2		(paralelo2[8:0]),
	       .paralelo3		(paralelo3[8:0]));
	
   phyEst phyEst(/*AUTOINST*/
		 // Outputs
		 .data_0		(data0[8:0]),
		 .data_1		(data1[8:0]),
		 .data_2		(data2[8:0]),
		 .data_3		(data3[8:0]),
		 // Inputs
		 .clk16			(clk16),
		 .clk2f			(clk2f),
		 .clk4f			(clk4f),
		 .clkf			(clkf),
		 .paralelo0		(paralelo0[8:0]),
		 .paralelo1		(paralelo1[8:0]),
		 .paralelo2		(paralelo2[8:0]),
		 .paralelo3		(paralelo3[8:0]),
		 .reset			(reset));

   probador prob(/*AUTOINST*/
		 // Outputs
		 .paralelo0		(paralelo0[8:0]),
		 .paralelo1		(paralelo1[8:0]),
		 .paralelo2		(paralelo2[8:0]),
		 .paralelo3		(paralelo3[8:0]),
		 .reset			(reset),
		 .clk16			(clk16),
		 // Inputs
		 .clk4f			(clk4f),
		 .clk2f			(clk2f),
		 .clkf			(clkf),
		 .data0			(data_0[8:0]),
		 .data1			(data_1[8:0]),
		 .data2			(data_2[8:0]),
		 .data3			(data_3[8:0]),
		 .data0E		(data0[8:0]),
		 .data1E		(data1[8:0]),
		 .data2E		(data2[8:0]),
		 .data3E		(data3[8:0]));
   
    ClkGenerator clk(/*AUTOINST*/
		     // Outputs
		     .clk4f		(clk4f),
		     .clk2f		(clk2f),
		     .clkf		(clkf),
		     // Inputs
		     .clk16f		(clk16),
		     .reset_L		(reset));

   

endmodule
