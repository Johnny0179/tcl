#ultrascale_cg base project tcl script

#set the project name
set prj_name ultrascale_cg

#set the project folder
set prj_folder H:/work/vivado/ultrascale_cg

# set the block design name
set bd_name ultrascale_base

#set the component
set component xczu3cg-sfvc784-1-e

#create project
create_project "$prj_name" "$prj_folder" -part "$component"

# create block design
create_bd_design "$bd_name"

# add zynq core
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:zynq_ultra_ps_e:3.3 zynq_ultra_ps_e_0
endgroup

# configure the core
set_property -dict [list CONFIG.PSU__CAN0__PERIPHERAL__ENABLE {1} \
                        CONFIG.PSU__CAN0__PERIPHERAL__IO {MIO 38 .. 39} \
                        CONFIG.PSU__CAN1__PERIPHERAL__ENABLE {1} \
                        CONFIG.PSU__CAN1__PERIPHERAL__IO {MIO 32 .. 33} \
                        CONFIG.PSU__DPAUX__PERIPHERAL__IO {MIO 27 .. 30} \
                        CONFIG.PSU__FPGA_PL0_ENABLE {0} \
                        CONFIG.PSU__ENET3__PERIPHERAL__ENABLE {1} \
                        CONFIG.PSU__ENET3__GRP_MDIO__ENABLE {1} \
                        CONFIG.PSU__GPIO1_MIO__PERIPHERAL__ENABLE {1} \
                        CONFIG.PSU__I2C0__PERIPHERAL__ENABLE {1} \
                        CONFIG.PSU__I2C0__PERIPHERAL__IO {MIO 34 .. 35} \
                        CONFIG.PSU__I2C1__PERIPHERAL__ENABLE {1} \
                        CONFIG.PSU__I2C1__PERIPHERAL__IO {MIO 24 .. 25} \
                        CONFIG.PSU__USB0__REF_CLK_FREQ {100} \
                        CONFIG.PSU__DP__REF_CLK_FREQ {108} \
                        CONFIG.PSU__SATA__REF_CLK_FREQ {125} \
                        CONFIG.PSU__DP__LANE_SEL {Dual Lower} \
                        CONFIG.SUBPRESET1 {DDR4_MICRON_MT40A256M16GE_083E} \
                        CONFIG.PSU__QSPI__PERIPHERAL__ENABLE {1} \
                        CONFIG.PSU__QSPI__PERIPHERAL__MODE {Dual Parallel} \
                        CONFIG.PSU__SD0__PERIPHERAL__ENABLE {1} \
                        CONFIG.PSU__SD0__SLOT_TYPE {eMMC} \
                        CONFIG.PSU__SD0__RESET__ENABLE {1} \
                        CONFIG.PSU__SD1__PERIPHERAL__ENABLE {1} \
                        CONFIG.PSU__SD1__PERIPHERAL__IO {MIO 46 .. 51} \
                        CONFIG.PSU__SD1__GRP_CD__ENABLE {1} \
                        CONFIG.PSU__SD1__SLOT_TYPE {SD 2.0} \
                        CONFIG.PSU__TRACE__PERIPHERAL__ENABLE {0} \
                        CONFIG.PSU__TTC0__PERIPHERAL__ENABLE {1} \
                        CONFIG.PSU__TTC1__PERIPHERAL__ENABLE {1} \
                        CONFIG.PSU__TTC2__PERIPHERAL__ENABLE {1} \
                        CONFIG.PSU__TTC3__PERIPHERAL__ENABLE {1} \
                        CONFIG.PSU__DDRC__CWL {16} \
                        CONFIG.PSU__DDRC__T_RAS_MIN {33} \
                        CONFIG.PSU__DDRC__T_RC {47.06} \
                        CONFIG.PSU__DDRC__T_RCD {15} \
                        CONFIG.PSU__DDRC__T_RP {15} \
                        CONFIG.PSU__UART1__PERIPHERAL__ENABLE {1} \
                        CONFIG.PSU__UART1__PERIPHERAL__IO {MIO 36 .. 37} \
                        CONFIG.PSU__USB0__PERIPHERAL__ENABLE {1} \
                        CONFIG.PSU__USB3_0__PERIPHERAL__ENABLE {1} \
                        CONFIG.PSU__USB3_0__PERIPHERAL__IO {GT Lane2} \
                        CONFIG.PSU__USE__M_AXI_GP2 {0} \
                        CONFIG.PSU__USE__FABRIC__RST {0} \
                        CONFIG.PSU_BANK_0_IO_STANDARD {LVCMOS18} \
                        CONFIG.PSU_BANK_1_IO_STANDARD {LVCMOS18} \
                        CONFIG.PSU_BANK_2_IO_STANDARD {LVCMOS18} \
                        CONFIG.PSU_BANK_3_IO_STANDARD {LVCMOS18} \
                        CONFIG.PSU__DISPLAYPORT__PERIPHERAL__ENABLE {1} \
                        CONFIG.PSU__SATA__PERIPHERAL__ENABLE {1} \
                        CONFIG.PSU__SATA__LANE1__IO {GT Lane3} \
                        CONFIG.PSU__CRF_APB__DP_VIDEO_REF_CTRL__SRCSEL {VPLL} \
                        CONFIG.PSU__CRF_APB__DP_AUDIO_REF_CTRL__SRCSEL {RPLL} \
                        CONFIG.PSU__CRF_APB__DP_STC_REF_CTRL__SRCSEL {RPLL}] [get_bd_cells zynq_ultra_ps_e_0] 
                        # must add a space before the [get_bd_cells zynq_ultra_ps_e_0]

# validate board design
validate_bd_design

update_compile_order -fileset sources_1

# wrapper the block design
make_wrapper -files [get_files $prj_folder/$prj_name.srcs/sources_1/bd/$bd_name/$bd_name.bd] -top

#set wrapper name
set wrapper_name $bd_name
append wrapper_name _wrapper

# add wrapper source
add_files -norecurse $prj_folder/$prj_name.srcs/sources_1/bd/$bd_name/hdl/$wrapper_name.v

# run synthesis
launch_runs synth_1 -jobs 8

# run implementation
launch_runs impl_1 -jobs 8

# generate bitstream


