// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Tue Jun  3 18:38:22 2025
// Host        : M700MD-1 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/user/Desktop/final_complete/final_complete.gen/sources_1/ip/image_rom/image_rom_sim_netlist.v
// Design      : image_rom
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "image_rom,blk_mem_gen_v8_4_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_9,Vivado 2024.2" *) 
(* NotValidForBitStream *)
module image_rom
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
  image_rom_blk_mem_gen_v8_4_9 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 26320)
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
