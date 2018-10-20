`timescale 100ns / 100ps
`include "phy_tx.v"
`include "Phy_Tx_Probador.v"
`include "cmos_cells.v"
`include "phy_tx_estructural.v"

module Test_Bench;

	wire [8:0] paralelo0,paralelo1,paralelo2,paralelo3;
	wire [1:0] serialCond, serialEst;
	wire clk16f, clk4f, clk2f, clkf, reset_L,reset;



	phy_tx      phy_tx_cond			(/*autoinst*/
    .clk16f                         (clk16f                                     ), // input 
    .clk4f                          (clk4f                                      ), // input 
    .clk2f                          (clk2f                                      ), // input 
    .clkf                           (clkf                                       ), // input 
    .reset                          (reset                                      ), // input 
    .reset_L                        (reset_L                                    ), // input 
    .paralelo0                      (paralelo0[8:0]                             ), // input 
    .paralelo1                      (paralelo1[8:0]                             ), // input 
    .paralelo2                      (paralelo2[8:0]                             ), // input 
    .paralelo3                      (paralelo3[8:0]                             ), // input 
    .serial                         (serialCond[1:0]                                )  // output
);

    phy_tx_estructural   phy_tx_est         (/*autoinst*/
    .clk16f                         (clk16f                                     ), // input 
    .clk4f                          (clk4f                                      ), // input 
    .clk2f                          (clk2f                                      ), // input 
    .clkf                           (clkf                                       ), // input 
    .reset                          (reset                                      ), // input 
    .reset_L                        (reset_L                                    ), // input 
    .paralelo0                      (paralelo0[8:0]                             ), // input 
    .paralelo1                      (paralelo1[8:0]                             ), // input 
    .paralelo2                      (paralelo2[8:0]                             ), // input 
    .paralelo3                      (paralelo3[8:0]                             ), // input 
    .serial                         (serialEst[1:0]                                )  // output
);


	
	Phy_Tx_Probador	 Probador 		(/*autoinst*/
    .serialCond                     (serialCond[1:0]                            ), // input 
    .serialEst                      (serialEst[1:0]                             ), // input 
    .clkf                           (clkf                                       ), // input 
    .clk2f                          (clk2f                                      ), // input 
    .clk4f                          (clk4f                                      ), // input 
    .paralelo0                      (paralelo0[8:0]                             ), // output
    .paralelo1                      (paralelo1[8:0]                             ), // output
    .paralelo2                      (paralelo2[8:0]                             ), // output
    .paralelo3                      (paralelo3[8:0]                             ), // output
    .reset                          (reset                                      ), // output
    .reset_L                        (reset_L                                    ), // output
    .clk16f                         (clk16f                                     )  // output
);

endmodule
