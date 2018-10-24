module ClkGenerator(	input 		clk16f,
						input 		reset_L,
						output reg 	clk4f,
						output reg 	clk2f,
						output reg 	clkf
						);

	//Contadores
	reg counter1;
	reg [1:0] counter2;
	reg [2:0] counter3;

	//Reset contadores y relojes 4f, 2f y f
	always @ (posedge clk16f) begin
		if(~reset_L)begin
		counter1<=0;
		counter2<=0;
		counter3<=0;
		clk4f<=1;
		clk2f<=1;
		clkf<=1;
		end
		else begin

		if(counter1>=1)begin
			clk4f <= ~clk4f;
			counter1<=0;
		end 
		else begin
			counter1<=counter1+1;
		end 

		if(counter2>=3)begin
			clk2f <= ~clk2f;
			counter2<=0;
		end 
		else begin
			counter2<=counter2+1;
		end 

		if(counter3>=7)begin
			clkf <= ~clkf;
			counter3<=0;
		end 
		else begin
			counter3<=counter3+1;
		end 							

		end
	end

endmodule
