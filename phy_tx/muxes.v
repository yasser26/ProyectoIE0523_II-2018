


module muxes(	
		input clk_f,
		input clk_2f,
		input clk_4f,
		input reset,	
		input [8:0] data0,
		input [8:0] data1,
		input [8:0] data2,
		input [8:0] data3,
		output reg [8:0] outEtapaL2);


	reg [8:0] outEtapaL1L2_0, outEtapaL1L2_1;
	reg selectorL1, selectorL2;
	reg [8:0] etapa1_preData0, etapa1_preData1, etapa1_preData2, etapa1_preData3;
	reg [8:0] etapa2_preData0, etapa2_preData1;

	always @(posedge clk_f) begin
		etapa1_preData0 <= (data0[8] ? data0 : {1'b0, etapa1_preData0[7:0]});
		etapa1_preData1 <= (data1[8] ? data1 : {1'b0, etapa1_preData1[7:0]});
		etapa1_preData2 <= (data2[8] ? data2 : {1'b0, etapa1_preData2[7:0]});
		etapa1_preData3 <= (data3[8] ? data3 : {1'b0, etapa1_preData3[7:0]});


		if (~reset) begin
			etapa1_preData0 <= 0;
			etapa1_preData1 <= 0;
			etapa1_preData2 <= 0;
			etapa1_preData3 <= 0;

		end

	end
	
	always @(posedge clk_2f) begin
		etapa2_preData0 <= (outEtapaL1L2_0[8] ? outEtapaL1L2_0 : {1'b0, etapa2_preData0[7:0]});
		etapa2_preData1 <= (outEtapaL1L2_1[8] ? outEtapaL1L2_1 : {1'b0, etapa2_preData1[7:0]});

		if (~reset) begin
			etapa2_preData0 <= 0;
			etapa2_preData1 <= 0;
			selectorL1 <= 0;
		end
		else
			selectorL1 <= ~selectorL1;	

	end

	always @(posedge clk_4f) begin
		if (~reset) begin
			outEtapaL2 <= 0;
			selectorL2 <= 0;
		end
		else begin
			selectorL2 <= ~selectorL2;
			
			if(selectorL2)
				outEtapaL2 <= etapa2_preData1;
			else
				outEtapaL2 <= etapa2_preData0;
		end



	end

/////////////////////////////////////////////////////////////////////

	always @(*) begin
		if (~reset) begin
			outEtapaL1L2_0 = 0;
			outEtapaL1L2_1 = 0;
		end
		else begin
			if(selectorL1) begin
				outEtapaL1L2_0 = etapa1_preData1;
				outEtapaL1L2_1 = etapa1_preData3;
			end
			else begin
				outEtapaL1L2_0 = etapa1_preData0;
				outEtapaL1L2_1 = etapa1_preData2;

			end
			
		end	
	
	end


endmodule
