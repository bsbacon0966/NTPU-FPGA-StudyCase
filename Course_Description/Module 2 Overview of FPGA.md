## FPGA 基本介紹與應用概覽
FPGA（Field-Programmable Gate Array）由 Xilinx 共同創辦人 Freeman 和 Vonderschmitt 於 1985 年發明，廣泛應用於原型設計、邏輯模擬、可重組態系統等，適合低至中等批量生產。相較於 ASIC，FPGA 強調彈性與重複使用性。

### FPGA 結構與元件
- 基於 LUT 的邏輯單元（Logic Cells），可以彈性實現任何邏輯電路。
- 搭配 Macro Cells（如記憶體、乘法器、I/O、處理器核心等，現成的高階功能模組加速部分任務(如與外界溝通傳輸等)

### 實例平台介紹：Xilinx Artix-7 XC7A35T-1CSG324
EGO1 開發板搭載 Xilinx Artix-7 XC7A35T-1CSG324C 晶片，而 Artix-7 是一款基於 28nm 製程的 FPGA，具有高效能與低功耗的特性，適合教學與中等複雜度的數位系統設計應用。

#### 主要特點如下：
- 邏輯單元（Logic Cells）數量：約 33,650 個
- 封裝類型：CSG324（324-pin BGA）
- 時脈速度等級：-1（標準速度）
#### 內建資源：
- 多個 Block RAM（適用於儲存或暫存資料）
- DSP Slice（可進行高速乘加運算）
- 豐富的 I/O 接腳（支援 USB、VGA、PS/2 等周邊連接）
- **時脈輸入支援高達 100 MHz**

### 開發環境與腳位配置
課程設計使用 Vivado Design Suite 作為主要開發環境，進行 RTL 編寫、綜合、實作與下載。
為了正確對應開發板的實體 I/O 接腳，專案會搭配使用 **XDC 約束檔** 來指定：
- I/O 標準（如 LVCMOS33）
- 封裝腳位對應（pin mapping）
- Clock 頻率與名稱（如 100MHz 時脈來源）

確保設計能在燒錄到實體板子時，可使硬體正確互動。