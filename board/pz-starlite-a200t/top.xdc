set_property BITSTREAM.CONFIG.UNUSEDPIN pulldown [current_design]
set_property BITSTREAM.GENERAL.COMPRESS true [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]

# 200 MHz differential oscillator.
set_property -dict { PACKAGE_PIN R4 IOSTANDARD DIFF_SSTL15 } [get_ports sys_diff_clock_clk_p]
set_property -dict { PACKAGE_PIN T4 IOSTANDARD DIFF_SSTL15 } [get_ports sys_diff_clock_clk_n]
create_clock -name sys_clock_200mhz -period 5.000 [get_ports sys_diff_clock_clk_p]

# The 200 MHz oscillator is connected through util_ds_buf before Clock Wizard.
# Permit the dedicated global-clock backbone route selected for this CCIO/MMCM pair.
set_property CLOCK_DEDICATED_ROUTE BACKBONE \
    [get_nets {riscv_i/util_ds_buf_0/U0/IBUF_OUT[0]}]

# Active-low global reset button.
set_property -dict { PACKAGE_PIN R14 IOSTANDARD LVCMOS33 } [get_ports reset]
