module ParaleloSerial_Probador	(	input [1:0] serialcond,
									//input [1:0] serialest,
									input [8:0] serial,
									input [8:0] spEst,
									input clk4f,
									output reg [8:0] paralelo,
									output reg reset,
									output reg reset_L,
									output reg clk16f
								);

initial clk16f <=0;
always begin
	#500 clk16f <= ~clk16f;
end

initial begin
	$dumpfile("SerialParalelo.vcd");
	$dumpvars;

	reset = 1'b1;
	reset_L = 1'b0;

	repeat (1) begin
	@(posedge clk16f);
	reset_L <= 1'b1;
	end

	repeat (1) begin
	@(posedge clk4f);
		paralelo <= 9'b011111111;//$FF valido
	end

	repeat (1) begin
	@(posedge clk4f);
		paralelo <= 9'b001010101;//$55 valido
		reset <= 1'b0;
	end


	repeat (1) begin
	@(posedge clk4f);
		paralelo <= 9'b100000000;//$00 valido 
	end

	repeat (1) begin
	@(posedge clk4f);
		paralelo <= 9'b011111111;//$FF invalido
	end

	repeat (1) begin
	@(posedge clk4f);
		paralelo <= 9'b001010101;//$55 invalido
	end


	repeat (1) begin
	@(posedge clk4f);
		paralelo <= 9'b100110000;//valido 
	end

	repeat (1) begin
	@(posedge clk4f);
		paralelo <= 9'b111110000;//valido 
	end

	repeat (2) begin
	@(posedge clk4f);
		
	end

	$finish;
end

endmodule

