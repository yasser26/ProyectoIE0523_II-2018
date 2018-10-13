module probador(			        input clk4f,
						input clk2f, 
						input clkf,
						input [8:0] data0,
						input [8:0] data1,
						input [8:0] data2,
						input [8:0] data3,
						input [8:0] data0E,
						input [8:0] data1E,
						input [8:0] data2E,
						input [8:0] data3E,
						output reg reset_L, 
						output reg clk16f,
						output reg [8:0] inEtapaL2
						);

initial clk16f <=0;
always begin
	#2 clk16f <= ~clk16f;
end

initial begin
	$dumpfile("demuxes.vcd");
	$dumpvars;

	reset_L <= 1'b0;
	@(posedge clk4f)
	inEtapaL2 <= 9'b100001100;

	#10 reset_L <= 1'b1;

	@(posedge clk4f)
	inEtapaL2 <= 9'b100001111;

	@(posedge clk4f)
	inEtapaL2 <= 9'b100010001;

	@(posedge clk4f)
	inEtapaL2 <= 9'b100010111;


	@(posedge clk4f)
	inEtapaL2 <= 9'b100001100;

	@(posedge clk4f)
	inEtapaL2 <= 9'b100001111;

	@(posedge clk4f)
	inEtapaL2 <= 9'b100010001;

	@(posedge clk4f)
	inEtapaL2 <= 9'b100010111;

	@(posedge clk4f)
	inEtapaL2 <= 9'b100001100;

	@(posedge clk4f)
	inEtapaL2 <= 9'b100001111;

	@(posedge clk4f)
	inEtapaL2 <= 9'b000010001;

	@(posedge clk4f)
	inEtapaL2 <= 9'b100010111;

	@(posedge clk4f)
	inEtapaL2 <= 9'b000001100;

	@(posedge clk4f)
	inEtapaL2 <= 9'b100001111;

	@(posedge clk4f)
	inEtapaL2 <= 9'b100010001;

	@(posedge clk4f)
	inEtapaL2 <= 9'b000010111;

	@(posedge clk4f)
	inEtapaL2 <= 9'b000000000;

	@(posedge clk4f)
	inEtapaL2 <= 9'b100111111;

	@(posedge clk4f)
	inEtapaL2 <= 9'b100011001;

	@(posedge clk4f)
	inEtapaL2 <= 9'b001110111;

	


	#10000 $finish;
end

endmodule

