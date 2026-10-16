# RTL8211F-CG management interface and active-low reset.
set_property -dict { PACKAGE_PIN T18 IOSTANDARD LVCMOS33 } [get_ports eth_mdio_clock]
set_property -dict { PACKAGE_PIN N15 IOSTANDARD LVCMOS33 } [get_ports eth_mdio_data]
set_property -dict { PACKAGE_PIN T20 IOSTANDARD LVCMOS33 SLEW SLOW DRIVE 16 } [get_ports eth_mdio_reset]

# RGMII interface, external 3.3 V I/O selected by the PHY straps.
set_property -dict { PACKAGE_PIN W19 IOSTANDARD LVCMOS33 } [get_ports rgmii_rxc]
set_property -dict { PACKAGE_PIN W20 IOSTANDARD LVCMOS33 } [get_ports rgmii_rx_ctl]
set_property -dict { PACKAGE_PIN U18 IOSTANDARD LVCMOS33 } [get_ports {rgmii_rd[0]}]
set_property -dict { PACKAGE_PIN R19 IOSTANDARD LVCMOS33 } [get_ports {rgmii_rd[1]}]
set_property -dict { PACKAGE_PIN R18 IOSTANDARD LVCMOS33 } [get_ports {rgmii_rd[2]}]
set_property -dict { PACKAGE_PIN P20 IOSTANDARD LVCMOS33 } [get_ports {rgmii_rd[3]}]
set_property -dict { PACKAGE_PIN P17 IOSTANDARD LVCMOS33 SLEW FAST DRIVE 16 } [get_ports rgmii_txc]
set_property -dict { PACKAGE_PIN R16 IOSTANDARD LVCMOS33 SLEW FAST DRIVE 16 } [get_ports rgmii_tx_ctl]
set_property -dict { PACKAGE_PIN P19 IOSTANDARD LVCMOS33 SLEW FAST DRIVE 16 } [get_ports {rgmii_td[0]}]
set_property -dict { PACKAGE_PIN P16 IOSTANDARD LVCMOS33 SLEW FAST DRIVE 16 } [get_ports {rgmii_td[1]}]
set_property -dict { PACKAGE_PIN N17 IOSTANDARD LVCMOS33 SLEW FAST DRIVE 16 } [get_ports {rgmii_td[2]}]
set_property -dict { PACKAGE_PIN R17 IOSTANDARD LVCMOS33 SLEW FAST DRIVE 16 } [get_ports {rgmii_td[3]}]

create_clock -period 8.000 -name rgmii_rx_clk [get_ports rgmii_rxc]

# RTL8211F RXDLY is strapped on. The wrapper adds 25 IDELAY taps to RXD and
# RX_CTL, matching the tested delayed-RX pattern used by other repo boards.
set_input_delay -clock rgmii_rx_clk -max 2.000 [get_ports {rgmii_rd* rgmii_rx_ctl}]
set_input_delay -clock rgmii_rx_clk -min 0.700 [get_ports {rgmii_rd* rgmii_rx_ctl}]
set_input_delay -clock rgmii_rx_clk -max 2.000 -clock_fall -add_delay [get_ports {rgmii_rd* rgmii_rx_ctl}]
set_input_delay -clock rgmii_rx_clk -min 0.700 -clock_fall -add_delay [get_ports {rgmii_rd* rgmii_rx_ctl}]

# TXDLY is strapped off. The MAC wrapper uses a 125 MHz, 90-degree clock
# so TXC is shifted by approximately 2 ns relative to TXD/TX_CTL.
