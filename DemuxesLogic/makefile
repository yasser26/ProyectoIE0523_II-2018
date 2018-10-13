CC0=iverilog
CC1=yosys
TARGET0=cmos_cells.v
TARGET1=testbench.v
TARGET2=sintesis.ys
TARGET4=DemuxesEstructural.v 


demuxes: compilarDemux crearVCD sintetizar compilarDemuxesSynth
	vvp demuxes
	gtkwave demuxes.vcd configDemux.gtkw

	

compilarDemux:
	$(CC0) $(TARGET1) -o demuxes

crearVCD:
	vvp demuxes

sintetizar:
	$(CC1) $(TARGET2)
	sed -i 's/demux/demuxEstructural/g' DemuxesEstructural.v

compilarDemuxesSynth:
	$(CC0) $(TARGET4) $(TARGET0) -o demuxSynth
