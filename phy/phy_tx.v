`include "ParaleloSerial.v"
`include "muxes.v"

module phy_tx	(			
							input 				clk16f,
							input 				clk4f,
							input 				clk2f,
							input				clkf,
							input 				reset,
							input 				reset_L,
							input [8:0] 		paralelo0,
							input [8:0] 		paralelo1,
							input [8:0] 		paralelo2,
							input [8:0] 		paralelo3,
							output[1:0]	         serial
						);

wire [8:0] outEtapaL2;
wire [8:0] paralelo0,paralelo1,paralelo2,paralelo3;
wire [1:0] serial;


	muxes muxesMod 	(/*autoinst*/
    .clk_f                          (clkf                                       ), // input 
    .clk_2f                         (clk2f                                      ), // input 
    .clk_4f                         (clk4f                                      ), // input 
    .reset                          (reset_L                                    ), // input 
    .data0                          (paralelo0[8:0]                             ), // input 
    .data1                          (paralelo1[8:0]                             ), // input 
    .data2                          (paralelo2[8:0]                             ), // input 
    .data3                          (paralelo3[8:0]                             ), // input 
    .outEtapaL2                     (outEtapaL2[8:0]                            )  // output
);

    ParaleloSerial  psMod   (/*autoinst*/
    .clk16f                         (clk16f                                     ), // input 
    .clk4f                          (clk4f                                      ), // input 
    .reset                          (reset                                      ), // input 
    .reset_L                        (reset_L                                    ), // input 
    .paralelo                       (outEtapaL2[8:0]                            ), // input 
    .serial                         (serial[1:0]                                )  // output
);

endmodule 
