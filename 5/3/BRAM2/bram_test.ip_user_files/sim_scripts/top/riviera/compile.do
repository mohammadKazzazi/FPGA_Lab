vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/smartconnect_v1_0
vlib riviera/axi_protocol_checker_v2_0_1
vlib riviera/axi_vip_v1_1_1
vlib riviera/processing_system7_vip_v1_0_3
vlib riviera/blk_mem_gen_v8_3_6
vlib riviera/axi_bram_ctrl_v4_0_13
vlib riviera/blk_mem_gen_v8_4_1
vlib riviera/axi_lite_ipif_v3_0_4
vlib riviera/lib_cdc_v1_0_2
vlib riviera/interrupt_control_v3_1_4
vlib riviera/axi_gpio_v2_0_17
vlib riviera/xlconstant_v1_1_3
vlib riviera/proc_sys_reset_v5_0_12

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap smartconnect_v1_0 riviera/smartconnect_v1_0
vmap axi_protocol_checker_v2_0_1 riviera/axi_protocol_checker_v2_0_1
vmap axi_vip_v1_1_1 riviera/axi_vip_v1_1_1
vmap processing_system7_vip_v1_0_3 riviera/processing_system7_vip_v1_0_3
vmap blk_mem_gen_v8_3_6 riviera/blk_mem_gen_v8_3_6
vmap axi_bram_ctrl_v4_0_13 riviera/axi_bram_ctrl_v4_0_13
vmap blk_mem_gen_v8_4_1 riviera/blk_mem_gen_v8_4_1
vmap axi_lite_ipif_v3_0_4 riviera/axi_lite_ipif_v3_0_4
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap interrupt_control_v3_1_4 riviera/interrupt_control_v3_1_4
vmap axi_gpio_v2_0_17 riviera/axi_gpio_v2_0_17
vmap xlconstant_v1_1_3 riviera/xlconstant_v1_1_3
vmap proc_sys_reset_v5_0_12 riviera/proc_sys_reset_v5_0_12

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/sc_util_v1_0_vl_rfs.sv" \

vlog -work axi_protocol_checker_v2_0_1  -sv2k12 "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../bram_test.srcs/sources_1/bd/top/ipshared/3b24/hdl/axi_protocol_checker_v2_0_vl_rfs.sv" \

vlog -work axi_vip_v1_1_1  -sv2k12 "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../bram_test.srcs/sources_1/bd/top/ipshared/a16a/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_3  -sv2k12 "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/top/ip/top_processing_system7_0_0/sim/top_processing_system7_0_0.v" \

vlog -work blk_mem_gen_v8_3_6  -v2k5 "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../bram_test.srcs/sources_1/bd/top/ipshared/2751/simulation/blk_mem_gen_v8_3.v" \

vcom -work axi_bram_ctrl_v4_0_13 -93 \
"../../../../bram_test.srcs/sources_1/bd/top/ipshared/20fd/hdl/axi_bram_ctrl_v4_0_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/top/ip/top_axi_bram_ctrl_0_0/sim/top_axi_bram_ctrl_0_0.vhd" \

vlog -work blk_mem_gen_v8_4_1  -v2k5 "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../bram_test.srcs/sources_1/bd/top/ipshared/67d8/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/top/ip/top_blk_mem_gen_0_0/sim/top_blk_mem_gen_0_0.v" \

vcom -work axi_lite_ipif_v3_0_4 -93 \
"../../../../bram_test.srcs/sources_1/bd/top/ipshared/cced/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../bram_test.srcs/sources_1/bd/top/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work interrupt_control_v3_1_4 -93 \
"../../../../bram_test.srcs/sources_1/bd/top/ipshared/8e66/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_17 -93 \
"../../../../bram_test.srcs/sources_1/bd/top/ipshared/c450/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/top/ip/top_axi_gpio_0_0/sim/top_axi_gpio_0_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/top/ipshared/b23b/hdl/pl_ram_ctrl_v2_0_S00_AXI.v" \
"../../../bd/top/ipshared/b23b/src/ram_read_write.v" \
"../../../bd/top/ipshared/b23b/hdl/pl_ram_ctrl_v2_0.v" \
"../../../bd/top/ip/top_pl_ram_ctrl_0_0/sim/top_pl_ram_ctrl_0_0.v" \
"../../../bd/top/ip/top_axi_smc_0/bd_0/sim/bd_b43a.v" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../bram_test.srcs/sources_1/bd/top/ipshared/786b/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/top/ip/top_axi_smc_0/bd_0/ip/ip_10/sim/bd_b43a_s00a2s_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../bram_test.srcs/sources_1/bd/top/ipshared/92d2/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/top/ip/top_axi_smc_0/bd_0/ip/ip_16/sim/bd_b43a_m00s2a_0.sv" \
"../../../bd/top/ip/top_axi_smc_0/bd_0/ip/ip_23/sim/bd_b43a_m01s2a_0.sv" \
"../../../bd/top/ip/top_axi_smc_0/bd_0/ip/ip_30/sim/bd_b43a_m02s2a_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../bram_test.srcs/sources_1/bd/top/ipshared/258c/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/top/ip/top_axi_smc_0/bd_0/ip/ip_36/sim/bd_b43a_m02e_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/top/ip/top_axi_smc_0/bd_0/ip/ip_31/sim/bd_b43a_m02arn_0.sv" \
"../../../bd/top/ip/top_axi_smc_0/bd_0/ip/ip_32/sim/bd_b43a_m02rn_0.sv" \
"../../../bd/top/ip/top_axi_smc_0/bd_0/ip/ip_33/sim/bd_b43a_m02awn_0.sv" \
"../../../bd/top/ip/top_axi_smc_0/bd_0/ip/ip_34/sim/bd_b43a_m02wn_0.sv" \
"../../../bd/top/ip/top_axi_smc_0/bd_0/ip/ip_35/sim/bd_b43a_m02bn_0.sv" \
"../../../bd/top/ip/top_axi_smc_0/bd_0/ip/ip_29/sim/bd_b43a_m01e_0.sv" \
"../../../bd/top/ip/top_axi_smc_0/bd_0/ip/ip_24/sim/bd_b43a_m01arn_0.sv" \
"../../../bd/top/ip/top_axi_smc_0/bd_0/ip/ip_25/sim/bd_b43a_m01rn_0.sv" \
"../../../bd/top/ip/top_axi_smc_0/bd_0/ip/ip_26/sim/bd_b43a_m01awn_0.sv" \
"../../../bd/top/ip/top_axi_smc_0/bd_0/ip/ip_27/sim/bd_b43a_m01wn_0.sv" \
"../../../bd/top/ip/top_axi_smc_0/bd_0/ip/ip_28/sim/bd_b43a_m01bn_0.sv" \
"../../../bd/top/ip/top_axi_smc_0/bd_0/ip/ip_22/sim/bd_b43a_m00e_0.sv" \
"../../../bd/top/ip/top_axi_smc_0/bd_0/ip/ip_17/sim/bd_b43a_m00arn_0.sv" \
"../../../bd/top/ip/top_axi_smc_0/bd_0/ip/ip_18/sim/bd_b43a_m00rn_0.sv" \
"../../../bd/top/ip/top_axi_smc_0/bd_0/ip/ip_19/sim/bd_b43a_m00awn_0.sv" \
"../../../bd/top/ip/top_axi_smc_0/bd_0/ip/ip_20/sim/bd_b43a_m00wn_0.sv" \
"../../../bd/top/ip/top_axi_smc_0/bd_0/ip/ip_21/sim/bd_b43a_m00bn_0.sv" \
"../../../bd/top/ip/top_axi_smc_0/bd_0/ip/ip_11/sim/bd_b43a_sarn_0.sv" \
"../../../bd/top/ip/top_axi_smc_0/bd_0/ip/ip_12/sim/bd_b43a_srn_0.sv" \
"../../../bd/top/ip/top_axi_smc_0/bd_0/ip/ip_13/sim/bd_b43a_sawn_0.sv" \
"../../../bd/top/ip/top_axi_smc_0/bd_0/ip/ip_14/sim/bd_b43a_swn_0.sv" \
"../../../bd/top/ip/top_axi_smc_0/bd_0/ip/ip_15/sim/bd_b43a_sbn_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../bram_test.srcs/sources_1/bd/top/ipshared/8ad6/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/top/ip/top_axi_smc_0/bd_0/ip/ip_7/sim/bd_b43a_s00mmu_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../bram_test.srcs/sources_1/bd/top/ipshared/0f5f/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/top/ip/top_axi_smc_0/bd_0/ip/ip_8/sim/bd_b43a_s00tr_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../bram_test.srcs/sources_1/bd/top/ipshared/925a/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/top/ip/top_axi_smc_0/bd_0/ip/ip_9/sim/bd_b43a_s00sic_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../bram_test.srcs/sources_1/bd/top/ipshared/1b0c/hdl/sc_switchboard_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/top/ip/top_axi_smc_0/bd_0/ip/ip_2/sim/bd_b43a_arsw_0.sv" \
"../../../bd/top/ip/top_axi_smc_0/bd_0/ip/ip_3/sim/bd_b43a_rsw_0.sv" \
"../../../bd/top/ip/top_axi_smc_0/bd_0/ip/ip_4/sim/bd_b43a_awsw_0.sv" \
"../../../bd/top/ip/top_axi_smc_0/bd_0/ip/ip_5/sim/bd_b43a_wsw_0.sv" \
"../../../bd/top/ip/top_axi_smc_0/bd_0/ip/ip_6/sim/bd_b43a_bsw_0.sv" \

vlog -work xlconstant_v1_1_3  -v2k5 "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../bram_test.srcs/sources_1/bd/top/ipshared/0750/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/top/ip/top_axi_smc_0/bd_0/ip/ip_0/sim/bd_b43a_one_0.v" \

vcom -work proc_sys_reset_v5_0_12 -93 \
"../../../../bram_test.srcs/sources_1/bd/top/ipshared/f86a/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/top/ip/top_axi_smc_0/bd_0/ip/ip_1/sim/bd_b43a_psr_aclk_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/top/ip/top_axi_smc_0/sim/top_axi_smc_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/top/ip/top_rst_ps7_0_50M_0/sim/top_rst_ps7_0_50M_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/ec67/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/02c8/hdl/verilog" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/1313/hdl" "+incdir+../../../../bram_test.srcs/sources_1/bd/top/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/top/sim/top.v" \

vlog -work xil_defaultlib \
"glbl.v"

