# CH340E USB-to-UART bridge.
set_property -dict { PACKAGE_PIN P14 IOSTANDARD LVCMOS33 } [get_ports usb_uart_rxd]
set_property -dict { PACKAGE_PIN P15 IOSTANDARD LVCMOS33 } [get_ports usb_uart_txd]
