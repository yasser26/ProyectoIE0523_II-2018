`include "phy_rx.v"
`include "phy_tx.v"


module phy(input clk16,input clk4f,input clk2f,	input clkf, input reset,input [8:0]paralelo0,input [8:0]paralelo1 ,input [8:0]paralelo2,input [8:0]paralelo3 ,output [8:0]data_0 ,output [8:0]data_1,output [8:0]data_2,output [8:0]data_3 );
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [1:0]		serial;			// From phyTx of phy_tx.v
   // End of automatics
   
   phy_rx phyRx (/*AUTOINST*/
		 // Outputs
		 .data_0		(data_0[8:0]),
		 .data_1		(data_1[8:0]),
		 .data_2		(data_2[8:0]),
		 .data_3		(data_3[8:0]),
		 // Inputs
		 .clk_f			(clkf),
		 .clk_2f		(clk2f),
		 .clk_4f		(clk4f),
		 .clk_16		(clk16),
		 .reset			(reset),
		 .serial		(serial[1:0]));

   phy_tx phyTx (/*AUTOINST*/
		 // Outputs
		 .serial		(serial[1:0]),
		 // Inputs
		 .clk16f		(clk16),
		 .clk4f			(clk4f),
		 .clk2f			(clk2f),
		 .clkf			(clkf),
		 .reset			(reset),
		 .reset_L		(reset),
		 .paralelo0		(paralelo0[8:0]),
		 .paralelo1		(paralelo1[8:0]),
		 .paralelo2		(paralelo2[8:0]),
		 .paralelo3		(paralelo3[8:0]));

   
   
   endmodule
