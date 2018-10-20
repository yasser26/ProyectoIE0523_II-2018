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
						output reg [1:0] serial
						);

initial clk16f <=0;
always begin
	#2 clk16f <= ~clk16f;
end

initial begin
	$dumpfile("phyRX.vcd");
	$dumpvars;

	reset_L <= 1'b0;

	#4 @(posedge clk16f) begin
	reset_L <= 1'b1;
	serial <= 2'b10;
	end

	@(posedge clk16f)
	serial <= 2'b11;

	@(posedge clk16f)
	serial <= 2'b11;

	@(posedge clk16f)
	serial <= 2'b00;

	@(posedge clk16f)
	serial <= 2'b10;

	@(posedge clk16f)
	serial <= 2'b11;

	@(posedge clk16f)
	serial <= 2'b11;

	@(posedge clk16f)
	serial <= 2'b00;

	@(posedge clk16f)
	serial <= 2'b10;

	@(posedge clk16f)
	serial <= 2'b11;

	@(posedge clk16f)
	serial <= 2'b11;

	@(posedge clk16f)
	serial <= 2'b00;

	@(posedge clk16f)
	serial <= 2'b10;

	@(posedge clk16f)
	serial <= 2'b11;

	@(posedge clk16f)
	serial <= 2'b11;

	@(posedge clk16f)
	serial <= 2'b00;

	@(posedge clk16f)
	serial <= 2'b11;

	@(posedge clk16f)
	serial <= 2'b11;

	@(posedge clk16f)
	serial <= 2'b11;

	@(posedge clk16f)
	serial <= 2'b11;

	@(posedge clk16f)
	serial <= 2'b10;

	@(posedge clk16f)
	serial <= 2'b00;

	@(posedge clk16f)
	serial <= 2'b10;

	@(posedge clk16f)
	serial <= 2'b00;

	@(posedge clk16f)
	serial <= 2'b01;

	@(posedge clk16f)
	serial <= 2'b10;

	@(posedge clk16f)
	serial <= 2'b01;

	@(posedge clk16f)
	serial <= 2'b10;


	#10000 $finish;
end

endmodule
