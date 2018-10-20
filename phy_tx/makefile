default:  phy_tx_bancodepruebas.v
	yosys sintesis.ys
	sed -i 's/phy_tx/phy_tx_estructural/g' phy_tx_estructural.v
	sed -i 's/ClkGenerator/ClkGenerator_estructural/g' phy_tx_estructural.v
	sed -i 's/ParaleloSerial/ParaleloSerial_estructural/g' phy_tx_estructural.v
	sed -i 's/muxes/muxes_estructural/g' phy_tx_estructural.v
	sed -i 's/clkgenMod/clkgenMod_estructural/g' phy_tx_estructural.v
	sed -i 's/muxesMod/muxesMod_estructural/g' phy_tx_estructural.v
	sed -i 's/psMod/psMod_estructural/g' phy_tx_estructural.v

	iverilog phy_tx_bancodepruebas.v
	vvp a.out
	gtkwave Phy_tx.vcd config.gtkw