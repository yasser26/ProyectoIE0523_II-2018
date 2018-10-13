module ParaleloSerial	(	input 				clk16f,
							input 				clk4f,
							input 				reset,
							input 				reset_L,
							input [8:0] 		paralelo,
							output reg	[1:0]	serial
						);
	reg [1:0] counterbc;
	reg [1:0] counterdata;

	always @ (posedge clk16f) begin
		counterbc<= paralelo[8]==0 ? counterbc+1 : counterbc;
		counterdata<=  paralelo[8]==1 ? counterdata+1 : counterdata;
		if(!reset_L)begin
			counterbc<=0;
			counterdata<=0;
		end
	end
	
	always @(*) begin
	if(paralelo[8]==0)
	begin
		case(counterbc)
		2'b00:	serial = 2'b10;
		2'b01:	serial = 2'b11;
		2'b10:	serial = 2'b11;
		default:serial = 2'b00;
		endcase
	end
	else
	begin
		case(counterdata)
		2'b00: begin
			serial[1] = paralelo[7];
			serial[0] = paralelo[6];
			end

		2'b01: begin
			serial[1] = paralelo[5];
			serial[0] = paralelo[4];
			end

		2'b10: begin
			serial[1] = paralelo[3];
			serial[0] = paralelo[2];
		       end

		default: begin
			serial[1] = paralelo[1];
			serial[0] = paralelo[0];
			end
		endcase
		
	end
	end

endmodule
