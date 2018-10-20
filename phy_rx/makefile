CC0=iverilog
CC1=yosys
TARGET0=cmos_cells.v
TARGET1=testbench.v
TARGET2=sintesis.ys
TARGET4=phy_rxEstru.v


phyRX: compilar_phyRX crearVCD sintetizar compilar_phyRX_Synth
	vvp phyRX
	gtkwave phyRX.vcd config_phyRX.gtkw

	

compilar_phyRX:
	$(CC0) $(TARGET1) -o phyRX

crearVCD:
	vvp phyRX

sintetizar:
	$(CC1) $(TARGET2)
	sed -i 's/phy_rx/phy_rxEstru/g' phy_rxEstru.v
	sed -i 's/demux/demuxEstru/g' phy_rxEstru.v
	sed -i 's/serialParalelo/serialParaleloEstru/g' phy_rxEstru.v

compilar_phyRX_Synth:
	$(CC0) $(TARGET4) $(TARGET0) -o phyRXSynth
