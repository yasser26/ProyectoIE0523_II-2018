CC0=iverilog
CC1=yosys
TARGET0=contador.v
TARGET1=testbench.v
TARGET2=sintesis.ys
TARGET4=MuxesEstructural.v 

ejemplosTarea1: compilarContador crearVCD sintetizar compilarMuxesSynth
	vvp muxes
	gtkwave ClkGen.vcd	

	

compilarContador:
	$(CC0) $(TARGET1) -o muxes

crearVCD:
	vvp muxes

sintetizar:
	$(CC1) $(TARGET2)

compilarMuxesSynth:
	$(CC0) $(TARGET4) -o muxSynth
