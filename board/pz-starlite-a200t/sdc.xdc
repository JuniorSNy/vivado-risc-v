# Four-bit SD interface. The socket card-detect switch is not connected to the FPGA.
set_property -dict { PACKAGE_PIN AA20 IOSTANDARD LVCMOS33 IOB TRUE } [get_ports sdio_clk]
set_property -dict { PACKAGE_PIN AB21 IOSTANDARD LVCMOS33 IOB TRUE } [get_ports sdio_cmd]
set_property -dict { PACKAGE_PIN AB18 IOSTANDARD LVCMOS33 IOB TRUE } [get_ports {sdio_dat[0]}]
set_property -dict { PACKAGE_PIN AA18 IOSTANDARD LVCMOS33 IOB TRUE } [get_ports {sdio_dat[1]}]
set_property -dict { PACKAGE_PIN AB22 IOSTANDARD LVCMOS33 IOB TRUE } [get_ports {sdio_dat[2]}]
set_property -dict { PACKAGE_PIN AA21 IOSTANDARD LVCMOS33 IOB TRUE } [get_ports {sdio_dat[3]}]
