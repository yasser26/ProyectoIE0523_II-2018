module ClkGen_Probador(	input clk4f,
						input clk2f, 
						input clkf,
						input clk4fe,
						input clk2fe,
						input clkfe,
						output reg reset_L, 
						output reg clk16f
						);

initial clk16f <=0;
always begin
	#2 clk16f <= ~clk16f;
end

initial begin
	$dumpfile("ClkGen.vcd");
	$dumpvars;

	reset_L = 1'b0;

	repeat (1) begin
	@(posedge clk16f);
	reset_L <= 1'b1;
	end

	repeat (75) begin
	@(posedge clk16f);

	end

	$finish;
end

endmodule

