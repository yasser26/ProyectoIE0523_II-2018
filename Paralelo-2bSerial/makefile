default:  ParaleloSerial_BancoDePruebas.v
	yosys sintesis.ys
	sed -i 's/ParaleloSerial/ParaleloSerialEstructural/g' ParaleloSerialEstructural.v
	iverilog ParaleloSerial_BancoDePruebas.v
	vvp a.out
	gtkwave ParaleloSerial.vcd config.gtkw
