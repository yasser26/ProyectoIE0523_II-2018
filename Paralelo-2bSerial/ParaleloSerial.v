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

		if(!reset_L)begin
			counterbc<=0;
			counterdata<=0;
			serial <= 'b0;
		end

		else begin

		//Envio de los $BC
		//Si el reset esta en alto o el valid del dato
		//esta en cero entonces mande $BC's
		if(reset || paralelo[8] == 0)begin
			if(counterbc == 0)begin
				serial <= 2'b10;
				counterbc <= counterbc +1;
			end

			if(counterbc == 1)begin
				serial <= 2'b11;
				counterbc <= counterbc +1;
			end

			if(counterbc == 2)begin
				serial <= 2'b11;
				counterbc <= counterbc +1;
			end

			if(counterbc == 3)begin
				serial <= 2'b00;
				counterbc <= 0;
			end
		end

		else begin

			//Envio de los datos cuando su bit de valid es 1
			if(paralelo[8] == 1)begin

				if(counterdata == 0)begin
					serial[1] <= paralelo[7];
					serial[0] <= paralelo[6];
					counterdata <= counterdata +1;
				end

				if(counterdata == 1)begin
					serial[1] <= paralelo[5];
					serial[0] <= paralelo[4];
					counterdata <= counterdata +1;
				end

				if(counterdata == 2)begin
					serial[1] <= paralelo[3];
					serial[0] <= paralelo[2];
					counterdata <= counterdata +1;
				end

				if(counterdata == 3)begin
					serial[1] <= paralelo[1];
					serial[0] <= paralelo[0];
					counterdata <= 0;
				end
			end
		end
		end
	end 

endmodule
