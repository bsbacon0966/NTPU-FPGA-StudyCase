# VGA 

## 1. VGA 簡介
- VGA（Video Graphics Array）是一種廣泛支援的影像顯示標準，常用於電腦與顯示器。
- 顯示器透過**水平同步（Horizontal Sync）**與**垂直同步（Vertical Sync）**控制畫面掃描。
- 常見解析度：640x480 @ 60Hz。
  - 對應 VGA 時脈：**25.2 MHz**

---

## 2. VGA 連接器與系統方塊圖
- VGA 通常透過 D-Sub 接頭與 FPGA 相連。
- 系統結構包含：
  - 時脈產生器
  - 同步訊號產生器
  - 顯示控制邏輯
  - 圖像記憶體（ROM）

---

## 3. 時脈產生器設定（Clock Generator）
> FPGA 不直接提供 25.2MHz 時脈，需透過 Vivado 生成。

### 使用 Clocking Wizard 產生 25.2MHz 時脈
1. 開啟 Vivado 的 **IP Catalog**。
2. 搜尋並選擇 `Clocking Wizard`。
3. 命名元件為：`VGAClk252`
4. 設定：
   - Primitive：`PLL`
   - Input Clock：`No buffer`
   - Output Clock：
     - `clk_out1 = 25.2 MHz`
     - Reset Type：`Active Low`
5. 點擊 **OK** → **Generate**

---

## 4. 圖像轉換與載入

### 將圖檔轉換為 `.coe` 檔案
- 為了載入圖像到 ROM，需先將圖檔（如 logo-3.png）轉換成 `.coe` 格式。
- `.coe` 檔可被 Block Memory Generator 作為初始化內容使用。

---

## 5. 建立圖像 ROM（Image ROM）

### 使用 Block Memory Generator 建立 ROM：
1. 開啟 **IP Catalog** → `Memories & Storage Elements` → `RAMs & ROMs & BRAM`
2. 雙擊 `Block Memory Generator`
3. 命名元件為：`image_rom`
4. 設定類型：`Single Port ROM`
5. 設定參數：
   - `Port A Width`: `12`（每像素 12 bits）
   - `Port A Depth`: `40000`（例如 400x100 畫素）
   - `Enable Port Type`: `Always Enable`
6. 其他選項：
   - 勾選 `Load init File`
   - 選擇 `.coe` 圖像檔
7. 點擊 **OK** → **Generate**

---

## 程式說明
- 圖像 ROM 中資料會依照 pixel address 被讀取。
- FPGA 根據掃描位置對應 address，將 RGB 資料輸出至 VGA 顯示。
```Verilog
module VGAController(
	input CLK_100M,
	input RESET,
	output vga_hs_pin,
	output vga_vs_pin,
	output [3:0] vga_R_Data_pin,
	output [3:0] vga_G_Data_pin,
	output [3:0] vga_B_Data_pin
);
	
	wire VGA_clk;
	wire [9:0] pixel_x;
	wire [9:0] pixel_y;
	
	VGAClk252 vga_clk_252(
		.clk_in1(CLK_100M),
		.resetn(RESET),
		.clk_out1(VGA_clk),
		.locked()
	);
	
	VGASync vga_sync(
		.clk(VGA_clk),
		.reset(RESET),		
		.hsync(vga_hs_pin),
		.vsync(vga_vs_pin),
		.pixel_x(pixel_x),
		.pixel_y(pixel_y)
	);
	
	PixelGen pixel_gen(
		.clk(VGA_clk),
		.reset(RESET),
		.pixel_x(pixel_x),
		.pixel_y(pixel_y),
		.R(vga_R_Data_pin),
		.G(vga_G_Data_pin),
		.B(vga_B_Data_pin)
	);
	
endmodule
```
- VGAClk252 使用 Clocking Wizard 將 FPGA 預設時脈（如 100MHz）轉為 VGA 所需的 25.2MHz 像素時脈，作為整個 VGA 顯示系統的節奏基準。

- VGASync 就像一個掃描器，依照 VGA 時序逐行、逐列掃描整個畫面：
輸出目前掃描位置的像素座標 pixel_x 和 pixel_y，從 (0,0) 走到 (639,479)，不斷循環。
同時產生 VGA 所需的同步訊號 hsync 和 vsync。

- PixelGen 根據座標，決定顯示的內容，output接上vga的RGB data pin，只要 PixelGen 輸出正確的顏色，當前螢幕的該格座標就會顯示顏色
