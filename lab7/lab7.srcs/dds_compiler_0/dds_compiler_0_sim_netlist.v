// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (lin64) Build 2188600 Wed Apr  4 18:39:19 MDT 2018
// Date        : Sun Aug 19 07:54:44 2018
// Host        : Vivado-dev running 64-bit Ubuntu 18.04.1 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/chase/github/FPGA_VHDL/lab7/lab7.srcs/sources_1/ip/dds_compiler_0/dds_compiler_0_sim_netlist.v
// Design      : dds_compiler_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "dds_compiler_0,dds_compiler_v6_0_16,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dds_compiler_v6_0_16,Vivado 2018.1" *) 
(* NotValidForBitStream *)
module dds_compiler_0
   (aclk,
    s_axis_phase_tvalid,
    s_axis_phase_tdata,
    m_axis_data_tvalid,
    m_axis_data_tdata);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 aclk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME aclk_intf, ASSOCIATED_BUSIF M_AXIS_PHASE:S_AXIS_CONFIG:M_AXIS_DATA:S_AXIS_PHASE, ASSOCIATED_RESET aresetn, ASSOCIATED_CLKEN aclken, FREQ_HZ 100000000, PHASE 0.000" *) input aclk;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_PHASE TVALID" *) (* x_interface_parameter = "XIL_INTERFACENAME S_AXIS_PHASE, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, LAYERED_METADATA undef" *) input s_axis_phase_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_PHASE TDATA" *) input [7:0]s_axis_phase_tdata;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_DATA TVALID" *) (* x_interface_parameter = "XIL_INTERFACENAME M_AXIS_DATA, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, LAYERED_METADATA undef" *) output m_axis_data_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_DATA TDATA" *) output [15:0]m_axis_data_tdata;

  wire aclk;
  wire [15:0]m_axis_data_tdata;
  wire m_axis_data_tvalid;
  wire [7:0]s_axis_phase_tdata;
  wire s_axis_phase_tvalid;
  wire NLW_U0_debug_axi_resync_in_UNCONNECTED;
  wire NLW_U0_debug_core_nd_UNCONNECTED;
  wire NLW_U0_debug_phase_nd_UNCONNECTED;
  wire NLW_U0_event_phase_in_invalid_UNCONNECTED;
  wire NLW_U0_event_pinc_invalid_UNCONNECTED;
  wire NLW_U0_event_poff_invalid_UNCONNECTED;
  wire NLW_U0_event_s_config_tlast_missing_UNCONNECTED;
  wire NLW_U0_event_s_config_tlast_unexpected_UNCONNECTED;
  wire NLW_U0_event_s_phase_chanid_incorrect_UNCONNECTED;
  wire NLW_U0_event_s_phase_tlast_missing_UNCONNECTED;
  wire NLW_U0_event_s_phase_tlast_unexpected_UNCONNECTED;
  wire NLW_U0_m_axis_data_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_phase_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_phase_tvalid_UNCONNECTED;
  wire NLW_U0_s_axis_config_tready_UNCONNECTED;
  wire NLW_U0_s_axis_phase_tready_UNCONNECTED;
  wire [0:0]NLW_U0_debug_axi_chan_in_UNCONNECTED;
  wire [7:0]NLW_U0_debug_axi_pinc_in_UNCONNECTED;
  wire [7:0]NLW_U0_debug_axi_poff_in_UNCONNECTED;
  wire [7:0]NLW_U0_debug_phase_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_data_tuser_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_phase_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_phase_tuser_UNCONNECTED;

  (* C_ACCUMULATOR_WIDTH = "8" *) 
  (* C_AMPLITUDE = "0" *) 
  (* C_CHANNELS = "1" *) 
  (* C_CHAN_WIDTH = "1" *) 
  (* C_DEBUG_INTERFACE = "0" *) 
  (* C_HAS_ACLKEN = "0" *) 
  (* C_HAS_ARESETN = "0" *) 
  (* C_HAS_M_DATA = "1" *) 
  (* C_HAS_M_PHASE = "0" *) 
  (* C_HAS_PHASEGEN = "0" *) 
  (* C_HAS_PHASE_OUT = "0" *) 
  (* C_HAS_SINCOS = "1" *) 
  (* C_HAS_S_CONFIG = "0" *) 
  (* C_HAS_S_PHASE = "1" *) 
  (* C_HAS_TLAST = "0" *) 
  (* C_HAS_TREADY = "0" *) 
  (* C_LATENCY = "2" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MODE_OF_OPERATION = "0" *) 
  (* C_MODULUS = "9" *) 
  (* C_M_DATA_HAS_TUSER = "0" *) 
  (* C_M_DATA_TDATA_WIDTH = "16" *) 
  (* C_M_DATA_TUSER_WIDTH = "1" *) 
  (* C_M_PHASE_HAS_TUSER = "0" *) 
  (* C_M_PHASE_TDATA_WIDTH = "1" *) 
  (* C_M_PHASE_TUSER_WIDTH = "1" *) 
  (* C_NEGATIVE_COSINE = "0" *) 
  (* C_NEGATIVE_SINE = "0" *) 
  (* C_NOISE_SHAPING = "0" *) 
  (* C_OPTIMISE_GOAL = "0" *) 
  (* C_OUTPUTS_REQUIRED = "0" *) 
  (* C_OUTPUT_FORM = "0" *) 
  (* C_OUTPUT_WIDTH = "16" *) 
  (* C_PHASE_ANGLE_WIDTH = "8" *) 
  (* C_PHASE_INCREMENT = "2" *) 
  (* C_PHASE_INCREMENT_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
  (* C_PHASE_OFFSET = "0" *) 
  (* C_PHASE_OFFSET_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
  (* C_POR_MODE = "0" *) 
  (* C_RESYNC = "0" *) 
  (* C_S_CONFIG_SYNC_MODE = "0" *) 
  (* C_S_CONFIG_TDATA_WIDTH = "1" *) 
  (* C_S_PHASE_HAS_TUSER = "0" *) 
  (* C_S_PHASE_TDATA_WIDTH = "8" *) 
  (* C_S_PHASE_TUSER_WIDTH = "1" *) 
  (* C_USE_DSP48 = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  dds_compiler_0_dds_compiler_v6_0_16 U0
       (.aclk(aclk),
        .aclken(1'b1),
        .aresetn(1'b1),
        .debug_axi_chan_in(NLW_U0_debug_axi_chan_in_UNCONNECTED[0]),
        .debug_axi_pinc_in(NLW_U0_debug_axi_pinc_in_UNCONNECTED[7:0]),
        .debug_axi_poff_in(NLW_U0_debug_axi_poff_in_UNCONNECTED[7:0]),
        .debug_axi_resync_in(NLW_U0_debug_axi_resync_in_UNCONNECTED),
        .debug_core_nd(NLW_U0_debug_core_nd_UNCONNECTED),
        .debug_phase(NLW_U0_debug_phase_UNCONNECTED[7:0]),
        .debug_phase_nd(NLW_U0_debug_phase_nd_UNCONNECTED),
        .event_phase_in_invalid(NLW_U0_event_phase_in_invalid_UNCONNECTED),
        .event_pinc_invalid(NLW_U0_event_pinc_invalid_UNCONNECTED),
        .event_poff_invalid(NLW_U0_event_poff_invalid_UNCONNECTED),
        .event_s_config_tlast_missing(NLW_U0_event_s_config_tlast_missing_UNCONNECTED),
        .event_s_config_tlast_unexpected(NLW_U0_event_s_config_tlast_unexpected_UNCONNECTED),
        .event_s_phase_chanid_incorrect(NLW_U0_event_s_phase_chanid_incorrect_UNCONNECTED),
        .event_s_phase_tlast_missing(NLW_U0_event_s_phase_tlast_missing_UNCONNECTED),
        .event_s_phase_tlast_unexpected(NLW_U0_event_s_phase_tlast_unexpected_UNCONNECTED),
        .m_axis_data_tdata(m_axis_data_tdata),
        .m_axis_data_tlast(NLW_U0_m_axis_data_tlast_UNCONNECTED),
        .m_axis_data_tready(1'b0),
        .m_axis_data_tuser(NLW_U0_m_axis_data_tuser_UNCONNECTED[0]),
        .m_axis_data_tvalid(m_axis_data_tvalid),
        .m_axis_phase_tdata(NLW_U0_m_axis_phase_tdata_UNCONNECTED[0]),
        .m_axis_phase_tlast(NLW_U0_m_axis_phase_tlast_UNCONNECTED),
        .m_axis_phase_tready(1'b0),
        .m_axis_phase_tuser(NLW_U0_m_axis_phase_tuser_UNCONNECTED[0]),
        .m_axis_phase_tvalid(NLW_U0_m_axis_phase_tvalid_UNCONNECTED),
        .s_axis_config_tdata(1'b0),
        .s_axis_config_tlast(1'b0),
        .s_axis_config_tready(NLW_U0_s_axis_config_tready_UNCONNECTED),
        .s_axis_config_tvalid(1'b0),
        .s_axis_phase_tdata(s_axis_phase_tdata),
        .s_axis_phase_tlast(1'b0),
        .s_axis_phase_tready(NLW_U0_s_axis_phase_tready_UNCONNECTED),
        .s_axis_phase_tuser(1'b0),
        .s_axis_phase_tvalid(s_axis_phase_tvalid));
endmodule

(* C_ACCUMULATOR_WIDTH = "8" *) (* C_AMPLITUDE = "0" *) (* C_CHANNELS = "1" *) 
(* C_CHAN_WIDTH = "1" *) (* C_DEBUG_INTERFACE = "0" *) (* C_HAS_ACLKEN = "0" *) 
(* C_HAS_ARESETN = "0" *) (* C_HAS_M_DATA = "1" *) (* C_HAS_M_PHASE = "0" *) 
(* C_HAS_PHASEGEN = "0" *) (* C_HAS_PHASE_OUT = "0" *) (* C_HAS_SINCOS = "1" *) 
(* C_HAS_S_CONFIG = "0" *) (* C_HAS_S_PHASE = "1" *) (* C_HAS_TLAST = "0" *) 
(* C_HAS_TREADY = "0" *) (* C_LATENCY = "2" *) (* C_MEM_TYPE = "1" *) 
(* C_MODE_OF_OPERATION = "0" *) (* C_MODULUS = "9" *) (* C_M_DATA_HAS_TUSER = "0" *) 
(* C_M_DATA_TDATA_WIDTH = "16" *) (* C_M_DATA_TUSER_WIDTH = "1" *) (* C_M_PHASE_HAS_TUSER = "0" *) 
(* C_M_PHASE_TDATA_WIDTH = "1" *) (* C_M_PHASE_TUSER_WIDTH = "1" *) (* C_NEGATIVE_COSINE = "0" *) 
(* C_NEGATIVE_SINE = "0" *) (* C_NOISE_SHAPING = "0" *) (* C_OPTIMISE_GOAL = "0" *) 
(* C_OUTPUTS_REQUIRED = "0" *) (* C_OUTPUT_FORM = "0" *) (* C_OUTPUT_WIDTH = "16" *) 
(* C_PHASE_ANGLE_WIDTH = "8" *) (* C_PHASE_INCREMENT = "2" *) (* C_PHASE_INCREMENT_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
(* C_PHASE_OFFSET = "0" *) (* C_PHASE_OFFSET_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) (* C_POR_MODE = "0" *) 
(* C_RESYNC = "0" *) (* C_S_CONFIG_SYNC_MODE = "0" *) (* C_S_CONFIG_TDATA_WIDTH = "1" *) 
(* C_S_PHASE_HAS_TUSER = "0" *) (* C_S_PHASE_TDATA_WIDTH = "8" *) (* C_S_PHASE_TUSER_WIDTH = "1" *) 
(* C_USE_DSP48 = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "dds_compiler_v6_0_16" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module dds_compiler_0_dds_compiler_v6_0_16
   (aclk,
    aclken,
    aresetn,
    s_axis_phase_tvalid,
    s_axis_phase_tready,
    s_axis_phase_tdata,
    s_axis_phase_tlast,
    s_axis_phase_tuser,
    s_axis_config_tvalid,
    s_axis_config_tready,
    s_axis_config_tdata,
    s_axis_config_tlast,
    m_axis_data_tvalid,
    m_axis_data_tready,
    m_axis_data_tdata,
    m_axis_data_tlast,
    m_axis_data_tuser,
    m_axis_phase_tvalid,
    m_axis_phase_tready,
    m_axis_phase_tdata,
    m_axis_phase_tlast,
    m_axis_phase_tuser,
    event_pinc_invalid,
    event_poff_invalid,
    event_phase_in_invalid,
    event_s_phase_tlast_missing,
    event_s_phase_tlast_unexpected,
    event_s_phase_chanid_incorrect,
    event_s_config_tlast_missing,
    event_s_config_tlast_unexpected,
    debug_axi_pinc_in,
    debug_axi_poff_in,
    debug_axi_resync_in,
    debug_axi_chan_in,
    debug_core_nd,
    debug_phase,
    debug_phase_nd);
  input aclk;
  input aclken;
  input aresetn;
  input s_axis_phase_tvalid;
  output s_axis_phase_tready;
  input [7:0]s_axis_phase_tdata;
  input s_axis_phase_tlast;
  input [0:0]s_axis_phase_tuser;
  input s_axis_config_tvalid;
  output s_axis_config_tready;
  input [0:0]s_axis_config_tdata;
  input s_axis_config_tlast;
  output m_axis_data_tvalid;
  input m_axis_data_tready;
  output [15:0]m_axis_data_tdata;
  output m_axis_data_tlast;
  output [0:0]m_axis_data_tuser;
  output m_axis_phase_tvalid;
  input m_axis_phase_tready;
  output [0:0]m_axis_phase_tdata;
  output m_axis_phase_tlast;
  output [0:0]m_axis_phase_tuser;
  output event_pinc_invalid;
  output event_poff_invalid;
  output event_phase_in_invalid;
  output event_s_phase_tlast_missing;
  output event_s_phase_tlast_unexpected;
  output event_s_phase_chanid_incorrect;
  output event_s_config_tlast_missing;
  output event_s_config_tlast_unexpected;
  output [7:0]debug_axi_pinc_in;
  output [7:0]debug_axi_poff_in;
  output debug_axi_resync_in;
  output [0:0]debug_axi_chan_in;
  output debug_core_nd;
  output [7:0]debug_phase;
  output debug_phase_nd;

  wire \<const0> ;
  wire aclk;
  wire event_s_phase_tlast_missing;
  wire [15:0]m_axis_data_tdata;
  wire m_axis_data_tvalid;
  wire [7:0]s_axis_phase_tdata;
  wire s_axis_phase_tvalid;
  wire NLW_i_synth_debug_axi_resync_in_UNCONNECTED;
  wire NLW_i_synth_debug_core_nd_UNCONNECTED;
  wire NLW_i_synth_debug_phase_nd_UNCONNECTED;
  wire NLW_i_synth_event_phase_in_invalid_UNCONNECTED;
  wire NLW_i_synth_event_pinc_invalid_UNCONNECTED;
  wire NLW_i_synth_event_poff_invalid_UNCONNECTED;
  wire NLW_i_synth_event_s_config_tlast_missing_UNCONNECTED;
  wire NLW_i_synth_event_s_config_tlast_unexpected_UNCONNECTED;
  wire NLW_i_synth_event_s_phase_chanid_incorrect_UNCONNECTED;
  wire NLW_i_synth_event_s_phase_tlast_unexpected_UNCONNECTED;
  wire NLW_i_synth_m_axis_data_tlast_UNCONNECTED;
  wire NLW_i_synth_m_axis_phase_tlast_UNCONNECTED;
  wire NLW_i_synth_m_axis_phase_tvalid_UNCONNECTED;
  wire NLW_i_synth_s_axis_config_tready_UNCONNECTED;
  wire NLW_i_synth_s_axis_phase_tready_UNCONNECTED;
  wire [0:0]NLW_i_synth_debug_axi_chan_in_UNCONNECTED;
  wire [7:0]NLW_i_synth_debug_axi_pinc_in_UNCONNECTED;
  wire [7:0]NLW_i_synth_debug_axi_poff_in_UNCONNECTED;
  wire [7:0]NLW_i_synth_debug_phase_UNCONNECTED;
  wire [0:0]NLW_i_synth_m_axis_data_tuser_UNCONNECTED;
  wire [0:0]NLW_i_synth_m_axis_phase_tdata_UNCONNECTED;
  wire [0:0]NLW_i_synth_m_axis_phase_tuser_UNCONNECTED;

  assign debug_axi_chan_in[0] = \<const0> ;
  assign debug_axi_pinc_in[7] = \<const0> ;
  assign debug_axi_pinc_in[6] = \<const0> ;
  assign debug_axi_pinc_in[5] = \<const0> ;
  assign debug_axi_pinc_in[4] = \<const0> ;
  assign debug_axi_pinc_in[3] = \<const0> ;
  assign debug_axi_pinc_in[2] = \<const0> ;
  assign debug_axi_pinc_in[1] = \<const0> ;
  assign debug_axi_pinc_in[0] = \<const0> ;
  assign debug_axi_poff_in[7] = \<const0> ;
  assign debug_axi_poff_in[6] = \<const0> ;
  assign debug_axi_poff_in[5] = \<const0> ;
  assign debug_axi_poff_in[4] = \<const0> ;
  assign debug_axi_poff_in[3] = \<const0> ;
  assign debug_axi_poff_in[2] = \<const0> ;
  assign debug_axi_poff_in[1] = \<const0> ;
  assign debug_axi_poff_in[0] = \<const0> ;
  assign debug_axi_resync_in = \<const0> ;
  assign debug_core_nd = \<const0> ;
  assign debug_phase[7] = \<const0> ;
  assign debug_phase[6] = \<const0> ;
  assign debug_phase[5] = \<const0> ;
  assign debug_phase[4] = \<const0> ;
  assign debug_phase[3] = \<const0> ;
  assign debug_phase[2] = \<const0> ;
  assign debug_phase[1] = \<const0> ;
  assign debug_phase[0] = \<const0> ;
  assign debug_phase_nd = \<const0> ;
  assign event_phase_in_invalid = \<const0> ;
  assign event_pinc_invalid = \<const0> ;
  assign event_poff_invalid = \<const0> ;
  assign event_s_config_tlast_missing = \<const0> ;
  assign event_s_config_tlast_unexpected = \<const0> ;
  assign event_s_phase_chanid_incorrect = \<const0> ;
  assign event_s_phase_tlast_unexpected = \<const0> ;
  assign m_axis_data_tlast = \<const0> ;
  assign m_axis_data_tuser[0] = \<const0> ;
  assign m_axis_phase_tdata[0] = \<const0> ;
  assign m_axis_phase_tlast = \<const0> ;
  assign m_axis_phase_tuser[0] = \<const0> ;
  assign m_axis_phase_tvalid = \<const0> ;
  assign s_axis_config_tready = \<const0> ;
  assign s_axis_phase_tready = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_ACCUMULATOR_WIDTH = "8" *) 
  (* C_AMPLITUDE = "0" *) 
  (* C_CHANNELS = "1" *) 
  (* C_CHAN_WIDTH = "1" *) 
  (* C_DEBUG_INTERFACE = "0" *) 
  (* C_HAS_ACLKEN = "0" *) 
  (* C_HAS_ARESETN = "0" *) 
  (* C_HAS_M_DATA = "1" *) 
  (* C_HAS_M_PHASE = "0" *) 
  (* C_HAS_PHASEGEN = "0" *) 
  (* C_HAS_PHASE_OUT = "0" *) 
  (* C_HAS_SINCOS = "1" *) 
  (* C_HAS_S_CONFIG = "0" *) 
  (* C_HAS_S_PHASE = "1" *) 
  (* C_HAS_TLAST = "0" *) 
  (* C_HAS_TREADY = "0" *) 
  (* C_LATENCY = "2" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MODE_OF_OPERATION = "0" *) 
  (* C_MODULUS = "9" *) 
  (* C_M_DATA_HAS_TUSER = "0" *) 
  (* C_M_DATA_TDATA_WIDTH = "16" *) 
  (* C_M_DATA_TUSER_WIDTH = "1" *) 
  (* C_M_PHASE_HAS_TUSER = "0" *) 
  (* C_M_PHASE_TDATA_WIDTH = "1" *) 
  (* C_M_PHASE_TUSER_WIDTH = "1" *) 
  (* C_NEGATIVE_COSINE = "0" *) 
  (* C_NEGATIVE_SINE = "0" *) 
  (* C_NOISE_SHAPING = "0" *) 
  (* C_OPTIMISE_GOAL = "0" *) 
  (* C_OUTPUTS_REQUIRED = "0" *) 
  (* C_OUTPUT_FORM = "0" *) 
  (* C_OUTPUT_WIDTH = "16" *) 
  (* C_PHASE_ANGLE_WIDTH = "8" *) 
  (* C_PHASE_INCREMENT = "2" *) 
  (* C_PHASE_INCREMENT_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
  (* C_PHASE_OFFSET = "0" *) 
  (* C_PHASE_OFFSET_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
  (* C_POR_MODE = "0" *) 
  (* C_RESYNC = "0" *) 
  (* C_S_CONFIG_SYNC_MODE = "0" *) 
  (* C_S_CONFIG_TDATA_WIDTH = "1" *) 
  (* C_S_PHASE_HAS_TUSER = "0" *) 
  (* C_S_PHASE_TDATA_WIDTH = "8" *) 
  (* C_S_PHASE_TUSER_WIDTH = "1" *) 
  (* C_USE_DSP48 = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  dds_compiler_0_dds_compiler_v6_0_16_viv i_synth
       (.aclk(aclk),
        .aclken(1'b0),
        .aresetn(1'b0),
        .debug_axi_chan_in(NLW_i_synth_debug_axi_chan_in_UNCONNECTED[0]),
        .debug_axi_pinc_in(NLW_i_synth_debug_axi_pinc_in_UNCONNECTED[7:0]),
        .debug_axi_poff_in(NLW_i_synth_debug_axi_poff_in_UNCONNECTED[7:0]),
        .debug_axi_resync_in(NLW_i_synth_debug_axi_resync_in_UNCONNECTED),
        .debug_core_nd(NLW_i_synth_debug_core_nd_UNCONNECTED),
        .debug_phase(NLW_i_synth_debug_phase_UNCONNECTED[7:0]),
        .debug_phase_nd(NLW_i_synth_debug_phase_nd_UNCONNECTED),
        .event_phase_in_invalid(NLW_i_synth_event_phase_in_invalid_UNCONNECTED),
        .event_pinc_invalid(NLW_i_synth_event_pinc_invalid_UNCONNECTED),
        .event_poff_invalid(NLW_i_synth_event_poff_invalid_UNCONNECTED),
        .event_s_config_tlast_missing(NLW_i_synth_event_s_config_tlast_missing_UNCONNECTED),
        .event_s_config_tlast_unexpected(NLW_i_synth_event_s_config_tlast_unexpected_UNCONNECTED),
        .event_s_phase_chanid_incorrect(NLW_i_synth_event_s_phase_chanid_incorrect_UNCONNECTED),
        .event_s_phase_tlast_missing(event_s_phase_tlast_missing),
        .event_s_phase_tlast_unexpected(NLW_i_synth_event_s_phase_tlast_unexpected_UNCONNECTED),
        .m_axis_data_tdata(m_axis_data_tdata),
        .m_axis_data_tlast(NLW_i_synth_m_axis_data_tlast_UNCONNECTED),
        .m_axis_data_tready(1'b0),
        .m_axis_data_tuser(NLW_i_synth_m_axis_data_tuser_UNCONNECTED[0]),
        .m_axis_data_tvalid(m_axis_data_tvalid),
        .m_axis_phase_tdata(NLW_i_synth_m_axis_phase_tdata_UNCONNECTED[0]),
        .m_axis_phase_tlast(NLW_i_synth_m_axis_phase_tlast_UNCONNECTED),
        .m_axis_phase_tready(1'b0),
        .m_axis_phase_tuser(NLW_i_synth_m_axis_phase_tuser_UNCONNECTED[0]),
        .m_axis_phase_tvalid(NLW_i_synth_m_axis_phase_tvalid_UNCONNECTED),
        .s_axis_config_tdata(1'b0),
        .s_axis_config_tlast(1'b0),
        .s_axis_config_tready(NLW_i_synth_s_axis_config_tready_UNCONNECTED),
        .s_axis_config_tvalid(1'b0),
        .s_axis_phase_tdata(s_axis_phase_tdata),
        .s_axis_phase_tlast(1'b0),
        .s_axis_phase_tready(NLW_i_synth_s_axis_phase_tready_UNCONNECTED),
        .s_axis_phase_tuser(1'b0),
        .s_axis_phase_tvalid(s_axis_phase_tvalid));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
qCgnaEvMQTkWHUfDHtEuAtaoSn+3hydoWo6AWM+SDLAn4XAHd0sZiRddMjRUfx7BpJOSUzEHJLkA
Gfie24TLjw==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
sHG0b904vNIWfXPQSJASBQkhl68ONGyY5BTuMxmzbmvdkj4Lal0zbcsaxX36r0a5AbpR1XErUH/r
q4yIh6J0SVjUqV4TlG5xESzf3u/WCqoBICMkBM+ZJcj5Bv8lOclFfPVJqc2up8yjFlAD31d80VTy
ZCOlXx10zRWTExJKTA8=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Jm8H34zo56iLqleDL70jGd3gyknHICF7PEQRlivp/f/DWdAgdfJJKe+tBngjQpaL8pLywSEIA8JA
mQ//qYzRS5Y2y9baTxj7PfrmBWroYLJ3X6xmvHhaSWIe5CEkhD0lQszP4UebDUOO0prcblxfp0vt
KOAsNxyTCpSm7xUHS4Q9JNUaX4fQnLqdHoRmhe6HYThbHGU4T69DYbiyQglC9bBnzHW8GO6K1pje
B286S/QJC9tdeyDPo54dy0oC1sigjC/JJXS2Mh8mSJkAGYhLMHcIjVNALI9WzkiaxcwU5UwaxhP4
nmJFAViqJC+6gixcF0bL3Sd14zmmjEQo0bHw7w==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ixS0Okzbl2wyEh5hUlpmAtUixTf8YAjY7DspLHo+jBxY5VPY4hF1DjZvfu0769EvMM8UPgHAcpuO
cQ2QncsQKyXCZtpjO/uHgEMsBXp3EGC4YqBEbgYL6zbxihMV4IYrJuG1dKFXxxVNJ5KqcTz/Let9
IGACB8bMr6qiRVLcVnKNFKVa+O9Jrr6PGcDepOOzFHNJ3267dPXb7IhymRqH+r0XzEDBDaivtwU8
6jQXW5bLnEB1pb9m3nXgK6cqTiKDnlZ0yH0dbUwZTp1FFGtf/Aygjt1+pU4kulBNXJyJGkZf/aOH
q/ogt7ILetlZcXyoz7Wr6i1rHtZs9GMrtwcQZg==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2017_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
E+CVy14ubH9fdzwrl3ur1bXUysHI1aE7n/BKUuOUw1aqR5isircNHD1OJKOp+TuppOQOKb7kM+Id
xKtirv0tMe+T3BTOMJwnxKojkrnPwobMRsz5b6frq+3OtNnTnrT8Vryh+0BJbwIKyC5MGWxBz7aL
LGeBblzdp5vTKgx62a7wbMfVRZQMMCzksmeC/fFzUB8buUjojNDpU1sLHw9LrGRoIeRXk7mfnkFD
JA4grnwsaHPYQaVLAgWRv7jzp38bJcbWK7WNO9XJhpcbxpnkbw1v5C0eYWeoeAJQvUsB09J6hkpd
qRh+ofxPu5TxZob7WEFYYaPsjpyT9Edu8VmZTw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
h4VgDV8L+YTYn4wNu1HP3RJqDKfBrbbmok1osjP2TnAhzElR12LiIRRRO2Zkzr88fhtilngsBWIs
vRQxgrMmzMOsrgxfF4riIgNcazaiUk61eTFuDIWfh8HIRGlg8b6sKskacZz4oYsOabmpy6U9NnaX
RGV16VXd31Q+0+0WwSw=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
hpsOj5rJR4dXCPEnQClZR8mxAxIuEevt8V3k5ByjgRbPbegIiMojwUVHCSHJ+yUmEVkVWrgxLg79
Me+7tQlpkjYyHdDRkm4ygy0C9Ol99pnxLaDgklTwjeEcKTIQZJvNTAWxt/rjS+8IzJgsv2MnmUXm
fjMqTy6MZ9SmBPxidB4GGcIXatwiyR/1oWuzsIyMbdr4+5P+rwiaiaDv8xPJ1OvgIMBsSEbTot0N
eU7NdhohNeWEcgUfuyiGZHIXZ/lqZK2judc/LeDaQ0as5AAA3/hMHgaJ5SQzUQNDvXa3O/oTpvhO
1sZPbZuGbhe+KQemtO5v3vpgNdOW0vKlZgc2oA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
VxTlVW7sy0KsBGvIVy4wANBDPnHBncB7YBlpHrassQ+FbUOULw4fNLtahAHAzyjVaPmWY3/9pVNv
7CXnC9aH4vvLjNyHOx3AUo1kCeROkFHoKmya4INpd1+E53tZsKiL3PqflAHMKIRmdY/ua18rP/nj
9Cbrqfy01RtYHWkBKJLvMWhsZdxM930gpCiMXHC7L9stdZguwhlP5CoG9z3BDqtugfrbx0S8LhJt
dY7xN81vNPNhVg9dekCII7PY4ZE34XCiZE9R5d4ampKuOtwuqYjTEEfg4WLPecSKXsEHZxHTubsg
EW1KB4y15wBFU+4PwdIPw81enLXHNwuc+t32bw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
x47VAk9j6yQglA+P1etjpBTMTh3p/qUrQZ4o8PlrOQwqIJZiKxd698d1yJnf58+HSXv4wS8NoUQf
CmiAngjiieWqf+wF5wiLEPuZaFzp25phjEMe1IFThXhmI+flV3wX/aUmXT2XdFUNCXjbn1HQXJzX
7X4oIObCY12mBWP/b2xMhGjJPp2Cg/Y2Mx0XtQtRelN4p1cjIWC6vG4ybAYkGUkS419bFzwASI2m
Hql+fLL9hCK6vOeQ7O7JtjH9bgqmRkk2pIzT8RSLkJHXZcBQV8UMhBWlBQiLlDPmN83ITbm1LlTT
fZiDHmebomZnIBEYYqe5mXDXMA/xHgUtv0Fbiw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 23728)
`pragma protect data_block
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
pp/kyK8v5lCu4uQrY5Sp3w==
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
