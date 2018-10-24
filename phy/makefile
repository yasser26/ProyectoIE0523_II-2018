CC0=iverilog
CC1=yosys
TARGET0=cmos_cells.v
TARGET1=testbench.v
TARGET2=sintesis.ys
TARGET4=phyEst.v


phyRX: compilarPhy crearVCD sintetizar compilarSynth
	vvp phyTest
	gtkwave phy.vcd phy.gtkw

compilarPhy:
	$(CC0) $(TARGET1) -o phyTest

crearVCD:
	vvp phyTest

sintetizar:
	$(CC1) $(TARGET2)
	sed -i 's/phy/phyEst/g' phyEst.v
	sed -i 's/demux/demuxEst/g' phyEst.v
	sed -i 's/serialParalelo/serialParaleloEst/g' phyEst.v
	sed -i 's/muxes/muxesEst/g' phyEst.v
	sed -i 's/ParaleloSerial/ParaleloSerialEst/g' phyEst.v
compilarSynth:
	$(CC0) $(TARGET4) $(TARGET0) -o phySynth
