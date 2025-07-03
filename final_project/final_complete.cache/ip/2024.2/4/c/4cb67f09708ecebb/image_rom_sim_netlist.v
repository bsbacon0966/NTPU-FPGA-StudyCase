// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Tue Jun  3 18:38:22 2025
// Host        : M700MD-1 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ image_rom_sim_netlist.v
// Design      : image_rom
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "image_rom,blk_mem_gen_v8_4_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_9,Vivado 2024.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_mode = "slave BRAM_PORTA" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [10:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [11:0]douta;

  wire [10:0]addra;
  wire clka;
  wire [11:0]douta;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [11:0]NLW_U0_doutb_UNCONNECTED;
  wire [10:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [10:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [11:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "11" *) 
  (* C_ADDRB_WIDTH = "11" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.35235 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "image_rom.mem" *) 
  (* C_INIT_FILE_NAME = "image_rom.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1600" *) 
  (* C_READ_DEPTH_B = "1600" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "12" *) 
  (* C_READ_WIDTH_B = "12" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "1600" *) 
  (* C_WRITE_DEPTH_B = "1600" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "12" *) 
  (* C_WRITE_WIDTH_B = "12" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_9 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[11:0]),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[10:0]),
        .regcea(1'b1),
        .regceb(1'b1),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[10:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[11:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2024.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
FPXllyX2NFs/RMngGqZy2bLYbZr92CdofeZrJOHklWXExpaPgHNYp2Lzm4MnflbnrfSkCmLwwKT5
zfRgEip7FKQ5Zhb73p0MAIADixBZ/ZRt4hQkJL0T9brm0waLHfanjnov2aCX6jN3LbQc3ujmDga6
Dd73k78u4xjRTDv1/P4=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kr7VKKvChFoiyRCReag+OvU3jnmG9pN0cv+BxhNmMKLthg/ksgNZyU3L+fQ7cmIQELtlUjwjkBAP
Jjq5RsCnHbJxj+Ys1GNhriiBsxLqxWCP8onhAVvgZN2xZFOih0UWpqlU8NVP8Eww1ohvkDgxTstC
3kDmYehxIUJjqCC/mgRZmuezqugrFdubYmBoz16tUvD17iA5qqCIMS9xSIXYp2LBNekmWEwrVqzu
R4koEo4UlXl/CEw0XY3QvMoHnlXgu6N/6sc+nxZtKSwjiMVvGnZE9UVvJPAC3Hn3zKFGlK53mmGO
Tj0dWzhwX0ahSYzkyJC/HLdbGZmriL2UNvDyFw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
CaLc9FGt3AdRHfNtGAsGFY/QEvHY1Vv4TvvgCDsdDMqiuDeLizFJDJeskBWjeKDoE2cufK8TxiBq
mySRQNJoeOKnxTiDdf+Rx6m0iR6h/YeswegYwgghpM5KVrl6mSwF3+4yEovPM7a+9ArDQ5vl+WT8
SilNGzyW0KnTwe7+szs=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
cEnudSW1X71p0Xuq6jrXOxHnBku87IA0RA3zKqmeZHZM0r+9rEm5MSzX8RecnQ994yiqeyxbIH2l
fGEzUzr0ZzryS3fkf2LnJuB39f2YARW9eVCSiaeWaraZuY1l89T+h3vgdlurS/1LIraYLS1MyOXa
6F1LAcQp3W4OO4ctc3q1FRMZGldRS1biMsKwJ8Lxj8NEOm67UfgFrJNQAxbVXEfbWRWhKtwNxcTB
JbgC8j4EHkIA46mzoHloeBAL6KieplQUBjKXSSTb66rxglbFhWLy+mirROHcocu9J4ZbvTRYZEww
4lso1lqAllVLAoKYqa3WImZuSRoTbGDngBt9Lg==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rOyI+x4PlmKcVSFoN3oKgSYpVlmYxc194Ej04il/YmBg10xopy4zmtu5sdCP/uGSNYcNGWeAiw01
mNf98KyNgTUFXruHCA38qjhhEIvl4vfWWn3W3mFRxrIuwmnreT6qTvgMaxIkCdVBDP7Iy7O6WmCf
3Va5X5hnCHhtXgX5UYniBHiLjmupv63B8XMAYDH2n6mQ3H0DF7mtb7psBafd0Z6+IWUbmzwMtKrf
ZrRJBGAhNT0i1KrEjEh/rWjN7Z7N32zQ+Pl1kc5gYCQIX5McfdTdqSaRVXZ/HF90ymS7/8d5LDyj
Er+ORdcjnOn6oAyY4PuUUl4OYUHv5k+RglTe5Q==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2023_11", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bJa7kPSpDipzoJoQu1APEjc8vFLqBfQZK/grZvWijD7/FgMTerFCWLUY6n8DWeGdvjXvTeyrqCHE
2rP/H57wUqPC8tIJlGm6ZYQGjZ3TgYqLrJshDE5zYMTO//q0vuSraWvZP7A7SLuW6y7tFE/nplpx
L8gbYORx6j70okGUwnamCMS9yhFr7Z2QTJne1k4GNFGvy66URk3k5cBPl5j4/1yc4xGV+aWYl6L8
q8RorRU/CltObHKrji/jdiY1WtdGrkpRyCEFc+XNPazL9xSLLu5bz6XlvKwoks+8a5KYT/VFUovM
JbM0bpAXM8Z7rGaPuXjqXtZBg5praTZLu/WNcA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PYKBDinOGc/kIVdFzXrz2wA4/QNFxLDrQfTWfR5TjYE6bm49vrZi0bawcr9HXp4OP1+XxPLB3oCP
oV5e/rYeDln531ebt8yEg27XCoSHEX4FU8oG8aBJ8fqgWayOnAMJt025WodOxuZXbhT1zPo7J3uh
6iO9Mv7RtYE2fZ1W+G8oN//FTOEJYPWlKYnt0cDeZrN3I4rHHptZHuu7l8T+df0PYea3x6U3Mvkl
ojZ+TwQtdu0NuYY5j3QNgx3+W2XYq1M773FAnEz/deW54EjE+jf1jjrBk2pl8SYxeKuutS15oPVF
eHdqXYVcJxoUY5JH8z04lITKEnZ4oq6sYS6dog==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
tl+2vFCWZ583gQGsVC7oopz2NCKBiJ9uOHYBGzJZheOHJMqI/ehNvo25l710eBx00tztXzM30AH6
ZhAJg+kJwE2jO0MV5fmG5dnwXmLqoGEJMBs7xwWxvYK7w/0z9M0AJKD7HnuC+IiLhNU/fIxyuE+I
+vWqp//RcfY0tMMp2I2J1yEW6GUahS1ve/4JchssZ7Xu7VthoSDWXMQWATbvsUsDzeSo2+Ruz8Kq
Dc05HqEU8NgBxDPPEKLCcdKLp4byglwj7iCAtCjsPy8P18qjgb2sycFjNgmaiNMMB51WqeD+hneG
hLOue9bqVdEojkrb3q4WbsGZKz0bAGsryxslOlYHP1b8vey3yI2ixA80wyERe8d3GRIeZiSxGykH
qWxsE6x/iyi8QRb5mXZPMApA+Fln8tYmn7+1rFCm8gF4gJWhr1PsSJqTi658symGrzT0Ghjvf2QL
SvvoaeNdy0pOsWs7jLBFndd4GiFA+9K6Y33sziLToU9EvvFokENIslod

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
oYiCujFRj1F3wKsGZlHR9niEtR9MLXEVAVfy+f/3xrmpW6Ye5a+fBCvm4TH+iRQefGHNdMPnzTNW
K/pEPAS9uMJjOdFiu+APT+LYrSRnEg4W0dX5buSDGM6LBWAuMseoTMjbJJoYDGLRckJgW43E30mX
ej4823nkbfwc+Ecbrup825qLyv8RTQLNHafvJA5lSapdqXwnlOIYRmcHn+sfAh5pGv9kW9aokcdh
ObR2XYxX99rYloyvz3x0pmjxD5ILW4SQMB1IUEuuyqX6eb5IQ+kZ41hjvsHIuQH29vzpCfV9Jqha
WC5yxxK1R+cleZSKD1H1gVzbTei8uFs/91Bgeg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
urNc+S8AFPj+GVFdqJE5V7P8O6QI6MA3nkwYb8NKbYbVufnXKg6voJIRYYeYr7EOa8mrqirozWbY
Lln9SLWnkaAy2LvL/N6WahoQdCt++4RH+xe768XvSrVUFPrIwZRixqMLurc/tPov4i5P/ukZKl18
ZPZvXRzUNlvCZnMPcF+5QCQihqPbjcZ0YyGgWgX/ipTGG3sNqmylGN7qLa4Rgqu/mB5a2xVyu5Wc
911+/X3VVFx697WVaP5V0SbOzYN8R8+8B8kdznwixMA+f4lSbBXyRysVOSzYjo8bKEMqyKMVBQn9
xDmEuV0DvVWXdO7VPvWA1LuJFwS07OxeI2GCcQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QcP7fsLZxaDrG29e9HQeXfu2TsKsdyW7Yc1vWct6lbmDEfXkWMU1fFWSPIjPzRc9UOnfEu0bRn+B
D+8MWokqes3WF7txljBmgUPiNGZ8arUU6ENa/IY/Wv7iaB/ZKM5PtdnFAkjDIrYyKFCTz/U6Yzwi
hBGGarK/wYQOLzeeKRewiPTiNUL7tztWuMZ1t1msxD951EeKrwjrjcXIIuf/TzrOGUOlWgjHlnrl
4Q/lfMAnRLBNTSWG+5wWewCE8jK2X/gJ5AV4p3x1WP3+JglbxpP39l3pzedXqciZPbuz2XlFnRPV
KByaUaAShzJ56p8+0HjWebibqQdieGNPiPWW0Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 26384)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
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
    reg GRESTORE_int;

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
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

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

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
