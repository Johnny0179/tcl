#zynq base project tcl script

#set the project name
set prj_name "zynq_7000_openamp"

#set the project folder
set prj_folder "G:/htrgns_comput/zynq_7000_openamp"

# set the block design name
set bd_name ="zynq_7000_openamp"

#set the component
set component "xc7z020clg484-2"

# create project
create_project $prj_name $prj_folder -part $component

# # create block design
# create_bd_design $bd_name
# update_compile_order -fileset sources_1

# # add zynq processor
# startgroup
# create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0
# endgroup

# # configure the zynq processor
# set_property -dict [list CONFIG.PCW_PRESET_BANK1_VOLTAGE {LVCMOS 1.8V} \
#                          CONFIG.PCW_UIPARAM_DDR_PARTNO {MT41J256M16 RE-125} \
#                          CONFIG.PCW_ENET0_PERIPHERAL_ENABLE {1} \
#                          CONFIG.PCW_ENET0_ENET0_IO {MIO 16 .. 27} \
#                          CONFIG.PCW_ENET0_GRP_MDIO_ENABLE {1} \
#                          CONFIG.PCW_ENET0_RESET_ENABLE {1} \
#                          CONFIG.PCW_UART1_PERIPHERAL_ENABLE {1} \
#                          CONFIG.PCW_UART1_UART1_IO {MIO 12 .. 13} \
#                          CONFIG.PCW_GPIO_MIO_GPIO_ENABLE {1} \
#                          CONFIG.PCW_GPIO_MIO_GPIO_IO {MIO} \
#                          CONFIG.PCW_MIO_16_IOTYPE {HSTL 1.8V} \
#                          CONFIG.PCW_MIO_16_SLEW {fast} \
#                          CONFIG.PCW_MIO_17_IOTYPE {HSTL 1.8V} \
#                          CONFIG.PCW_MIO_17_SLEW {fast} \
#                          CONFIG.PCW_MIO_18_IOTYPE {HSTL 1.8V} \
#                          CONFIG.PCW_MIO_18_SLEW {fast} \
#                          CONFIG.PCW_MIO_19_IOTYPE {HSTL 1.8V} \
#                          CONFIG.PCW_MIO_19_SLEW {fast} \
#                          CONFIG.PCW_MIO_20_IOTYPE {HSTL 1.8V} \
#                          CONFIG.PCW_MIO_20_SLEW {fast} \
#                          CONFIG.PCW_MIO_21_IOTYPE {HSTL 1.8V} \
#                          CONFIG.PCW_MIO_21_SLEW {fast} \
#                          CONFIG.PCW_MIO_22_IOTYPE {HSTL 1.8V} \
#                          CONFIG.PCW_MIO_22_SLEW {fast} \
#                          CONFIG.PCW_MIO_23_IOTYPE {HSTL 1.8V} \
#                          CONFIG.PCW_MIO_23_SLEW {fast} \
#                          CONFIG.PCW_MIO_24_IOTYPE {HSTL 1.8V} \
#                          CONFIG.PCW_MIO_24_SLEW {fast} \
#                          CONFIG.PCW_MIO_25_IOTYPE {HSTL 1.8V} \
#                          CONFIG.PCW_MIO_25_SLEW {fast} \
#                          CONFIG.PCW_MIO_26_IOTYPE {HSTL 1.8V} \
#                          CONFIG.PCW_MIO_26_SLEW {fast} \
#                          CONFIG.PCW_MIO_27_IOTYPE {HSTL 1.8V} \
#                          CONFIG.PCW_MIO_27_SLEW {fast}] \
#                          CONFIG.PCW_SD0_PERIPHERAL_ENABLE {1} \
#                          [get_bd_cells processing_system7_0]

# set_property -dict [list CONFIG.PCW_ENET0_RESET_ENABLE {1} CONFIG.PCW_ENET0_RESET_IO {MIO 7} CONFIG.PCW_GPIO_MIO_GPIO_ENABLE {1} CONFIG.PCW_GPIO_MIO_GPIO_IO {MIO}] [get_bd_cells processing_system7_0]

# # auto generation
# apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 -config {make_external "FIXED_IO, DDR" Master "Disable" Slave "Disable" }  [get_bd_cells processing_system7_0]

# # validate block design
# validate_bd_design

# # save block design
# save_bd_design