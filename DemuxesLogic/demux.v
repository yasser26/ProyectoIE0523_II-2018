

module demux(	input clk_f,
		input clk_2f,
		input clk_4f,
		input reset,
		input [8:0] inEtapaL2,	
		output reg [8:0] data0,
		output reg [8:0] data1,
		output reg [8:0] data2,
		output reg [8:0] data3);

	reg [8:0] outEtapaL1L2_0, outEtapaL1L2_1;
	reg selectorL1, selectorL2;
	reg [8:0] etapa1_inData0, etapa1_inData1, etapa1_inData2, etapa1_inData3;
	reg [8:0] etapa2_inData0, etapa2_inData1;

	always @(posedge clk_4f) begin
		if(~reset) begin
			selectorL2 <= 0;
			outEtapaL1L2_0 <= 0;
			outEtapaL1L2_1 <= 0;
		end
		else begin
			selectorL2 <= ~selectorL2;
			if(selectorL2)
				outEtapaL1L2_1 <= (inEtapaL2[8] ? inEtapaL2: etapa2_inData1);
			else
				outEtapaL1L2_0 <= (inEtapaL2[8] ? inEtapaL2: etapa2_inData0);

		end

	end


	always @(posedge clk_2f) begin
		etapa2_inData0 <= (outEtapaL1L2_0[8] ? outEtapaL1L2_0 : {1'b0, etapa2_inData0[7:0]});
		etapa2_inData1 <= (outEtapaL1L2_1[8] ? outEtapaL1L2_1 : {1'b0, etapa2_inData1[7:0]});

		if(~reset) begin
			etapa2_inData0 <= 0;
			etapa2_inData1 <= 0;
			etapa1_inData0 <= 0;
			etapa1_inData1 <= 0;
			etapa1_inData2 <= 0;
			etapa1_inData3 <= 0;
			selectorL1 <= 0;
		end
		else begin
			selectorL1 <= ~selectorL1;
		
			if(selectorL1) begin
				etapa1_inData1 <= (etapa2_inData0[8] ? etapa2_inData0 : etapa1_inData1);
				etapa1_inData3 <= (etapa2_inData1[8] ? etapa2_inData1 : etapa1_inData3);

			end 
			else begin
				etapa1_inData0 <= (etapa2_inData0[8] ? etapa2_inData0 : etapa1_inData0);
				etapa1_inData2 <= (etapa2_inData1[8] ? etapa2_inData1 : etapa1_inData2);

			end
		end


	end

	always @(posedge clk_f) begin

		if(~reset) begin
			data0 = 0;
			data1 = 0;
			data2 = 0;
			data3 = 0;

		end
		else begin
			data0 = (etapa1_inData0[8] ? etapa1_inData0 : {1'b0, etapa1_inData0[7:0]});
			data1 = (etapa1_inData1[8] ? etapa1_inData1 : {1'b0, etapa1_inData1[7:0]});
			data2 = (etapa1_inData2[8] ? etapa1_inData2 : {1'b0, etapa1_inData2[7:0]});
			data3 = (etapa1_inData3[8] ? etapa1_inData3 : {1'b0, etapa1_inData3[7:0]});



		end
	end


endmodule
