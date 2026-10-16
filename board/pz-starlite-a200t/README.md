# Puzhi PA-StarLite XC7A200T

Initial board support for the PA-StarLite fitted with
`xc7a200tfbg484-2`, targeting Vivado 2022.2.

Imported from [JuniorSNy/pz-starlite-a200t](https://github.com/JuniorSNy/pz-starlite-a200t)
at commit `ec573a2d39208cdfb945d81321cc87a1556a57fd`.
This directory is integrated into the repository's existing `BOARD` build flow;
only the Vivado 2022.2 block-design script is provided.

Hardware assumptions are taken from the PA-StarLite V1.1 schematic and vendor
examples:

- 200 MHz differential input clock on R4/T4;
- two MT41K256M16 DDR3L devices, 32-bit data width and 1 GiB total capacity;
- CH340E UART on P14/P15;
- four-bit SD interface; card detect is not routed to the FPGA and is tied
  active inside the block design;
- RTL8211F-CG at MDIO address 1, with RXDLY enabled and TXDLY disabled;
  its interrupt output is not connected and is tied inactive in the design;
- Winbond W25Q128JVSIQ 128-Mbit quad-SPI configuration flash (U7).

The SPI flash bitstream settings follow `SPI-flash.pdf`: 3.3 V configuration,
compressed bitstream, 50 MHz configuration rate, x4 bus width, and falling-edge
SPI clocking. Vivado 2022.2 does not provide a W25Q128JV entry, so the
compatible 3.3 V, 128-Mbit, single-device x4 entry
`w25q128fv-qspi-x4-single` is used for programming.

Create the Vivado project with:

```sh
source /tools/Xilinx/Vivado/2022.2/settings64.sh
make BOARD=pz-starlite-a200t CONFIG=rocket64b1 vivado-project
```

The first implementation should be checked with DDR calibration, RGMII timing,
and SD read/write tests before treating the port as production-ready.
