// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (lin64) Build 2188600 Wed Apr  4 18:39:19 MDT 2018
// Date        : Sun Aug 19 07:54:42 2018
// Host        : Vivado-dev running 64-bit Ubuntu 18.04.1 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ dds_compiler_0_sim_netlist.v
// Design      : dds_compiler_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "dds_compiler_0,dds_compiler_v6_0_16,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dds_compiler_v6_0_16,Vivado 2018.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dds_compiler_v6_0_16 U0
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
(* C_USE_DSP48 = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dds_compiler_v6_0_16
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dds_compiler_v6_0_16_viv i_synth
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
NqHn2ZpAAJ8IgG8Hekaz3ZqqBk0gQB2pM0EvUGGEvtPh1MAeR13G6dM9YVlZKRisTA5vNT4lPY89
rv09D/QTvHQuKqNVqDgBNQIE7PTsshCuRgcrTuU/hPDokoHtIGTcPy4NHHmH/lFuUJAtVXq1EprX
XgMbPGLyhOO+QiQE3hwjy7Im9oJetY6vyC7WK+4xuYOmZObZeUSZO6rLd8iMkMUXMQ/jQhKNCTGO
Xq/0cDDAk/RJzJn0Es+LWUFHaSgylNnzs10sh0Ed6aq5zfnQwCkDLvIOaGOlFruyJsK5RYj4zSz6
wD8h+cF/3BKOPbocfwXwdgxkiQ7DLFtX6MgmxA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Tc2Iova9XnQNNRCeJ/Bz0wIdpiPd/XpyiQNjo2jYeF8ABXmG/XafeXgipyI7jl79+wi0aWUEkwN6
3AGyTiWmO8vSUMhfCr9NViC13+aKjbAhXxghmmW2oOpngJwOsCAAepH0tUzyx+z2gTcUuKoFAg4j
UAqRlPfGfGTem2zT/x4+QwOrnxIUlt0vyz6D9qLJlUFGeaxvzt8FpemVot86PQC7gi0hc3NXJLZN
I0fEnpXZSVbuxn/kK8mvs6/vzyBbciUBDXkq2QBx/qaKr2QepjWIg+z/Dui6WJKjLXP8dM6h9FV2
a9ZxE55WH8MlEGtAHW+4YDYJbNQlr4idRaS7XQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 23904)
`pragma protect data_block
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
3Gb8Tikiv+ErrG4bNbNLU/sfjzTO
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
