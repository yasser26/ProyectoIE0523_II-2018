`include "demux.v"
`include "serialParalelo.v"

module phy_rx(  input clk_f,
                input clk_2f,
                input clk_4f,
                input clk_16,
                input reset,
                input [1:0] serial,
                output [8:0] data_0,
            	output [8:0] data_1,
            	output [8:0] data_2,
            	output [8:0] data_3);

  wire [8:0] inDemuxes;
  
  serialParalelo serial_paralelo (  .clk16(clk_16),
                                    .reset16(reset),
                                    .serial(serial),
                                    .outParalelo(inDemuxes));

  demux demuxes (  .clk_f(clk_f),
                   .clk_2f(clk_2f),
                   .clk_4f(clk_4f),
                   .reset(reset),
                   .inEtapaL2(inDemuxes),
                   .data0(data_0),
                   .data1(data_1),
                   .data2(data_2),
                   .data3(data_3));

endmodule
