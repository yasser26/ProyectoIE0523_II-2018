module ClkGen_Probador(			        input clk4f,
						input clk2f, 
						input clkf,
						input clk4fe,
						input clk2fe,
						input clkfe,
						input [8:0] outEtapaL2,
						input [8:0] outEtapaL2Estru,
						output reg reset_L, 
						output reg clk16f,
						output reg [8:0] data0,
						output reg [8:0] data1,
						output reg [8:0] data2,
						output reg [8:0] data3
						);

initial clk16f <=1;
always begin
	#2 clk16f <= ~clk16f;
end

initial begin
	$dumpfile("ClkGen.vcd");
	$dumpvars;

	reset_L = 1'b0;
	data0 <= 9'b100000000;
	data1 <= 9'b100000001;
	data2 <= 9'b100000010;
	data3 <= 9'b100000011;

	#4 reset_L = 1'b1;


	@(posedge clkf) begin
	data0 <= 9'b111000000;
	data1 <= 9'b100000010;
	data2 <= 9'b100000001;
	data3 <= 9'b100000000;
	end

	@(posedge clkf) begin
	data0 <= 9'b111000000;
	data1 <= 9'b100000001;
	data2 <= 9'b100000010;
	data3 <= 9'b100000011;
	end

	@(posedge clkf) begin
	data0 <= 9'b111000000;
	data1 <= 9'b100000010;
	data2 <= 9'b100000001;
	data3 <= 9'b100000000;
	end

	#10000 $finish;
end

endmodule

