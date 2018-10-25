/*Módulo Serial a Paralelo
 En este módulo se tiene por entrada una serie de 2 bits a frecuencia 16f, que describen un número de 8 bits
  + 1 bit de valid, por salida se tiene el número recibido de 8 bits y su bit de válido hacia la etapa de 
 demuxes */
module serialParalelo(input clk16 , input reset16,input [1:0] serial,output reg [8:0] outParalelo);
   reg [7:0] paralelo; // registro para guardar el número de 8-bits que entra
   reg [2:0] contador; // contador de BC
   reg [1:0] i;   //genvar   i;
   
   wire      com, active,valid; // variables para asignar bit de válido
   
   /*Sección que toma las entradas de 2 bits y las asigna al registro paralelo en orden*/  
   always @(posedge clk16) 
     begin
	
	if(~reset16) // inicialmente mi contador y número paralelo son 0
	  begin
	     contador <= 2'b00;
	     paralelo <= 8'b11111111;
	     i <= 2'b00;
	     outParalelo <= 0;
	 end
	else
	begin
		contador <= contador > 4 ? 5 : paralelo==8'b10111100 ? contador+1:contador; //Reviso si tengo BC en la entrada
		i <= (i == 2'b11) ? 0 : i+1;// si i es 3 lo vuelvo a 0
		paralelo<= paralelo;
		outParalelo[8] <= (i == 2'b11) ?  valid : outParalelo[8];
		outParalelo[7:0] <= (i == 2'b11) ? com ? paralelo : outParalelo[7:0] : outParalelo[7:0] ;
	end
		
     end 
   /*Acá se asigna según el contador i cada entrada mi vector paralelo, se debe poner datos basura del bit siguiente en cada etapa para 
	que no cuente más bc de la cuenta*/


  always @ (*)
	begin
	case(i)
	  2'b00: begin
		 paralelo[7:6] = serial;
		 paralelo[5]= 1'b0;
		 end
	  2'b01: begin
		paralelo[5:4] = serial;
		paralelo[3]= 1'b0;
		end
	  2'b10: begin
		paralelo[3:2] = serial;
		paralelo[1]= 1'b1;
		end
	  default: paralelo[1:0] = serial;
	endcase 

	
	end
   
   assign active = (contador >=4) ? 1 : 0;
   assign com = (paralelo!=8'b10111100) ? 1 : 0;
   assign valid = active && com;
  
   
endmodule
