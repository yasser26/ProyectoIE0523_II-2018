CC0=iverilog
CC1=yosys
TARGET0=cmos_cells.v
TARGET1=testbench.v
TARGET2=sintesis.ys
TARGET4=MuxesEstructural.v 


proyecto_avance1: sintetizar compilar crearVCD compilarMuxesSynth
	vvp muxes
	gtkwave ClkGen.vcd configMuxes.gtkw	

	

compilar:
	$(CC0) $(TARGET1) -o muxes

crearVCD:
	vvp muxes

sintetizar:
	$(CC1) $(TARGET2)
	sed -i 's/muxes/muxesEstructural/g' MuxesEstructural.v

compilarMuxesSynth:
	$(CC0) $(TARGET4) $(TARGET0) -o muxSynth
