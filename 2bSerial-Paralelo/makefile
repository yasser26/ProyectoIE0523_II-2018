default:  ParaleloSerial_BancoDePruebas.v
	yosys yosys.ys
	sed -i 's/serialParalelo/serialParaleloEst/g' mainSynth.v
	iverilog ParaleloSerial_BancoDePruebas.v
	vvp a.out
	gtkwave SerialParalelo.vcd config.gtkw
