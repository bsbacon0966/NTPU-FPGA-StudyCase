# 🔧 RTL（Register Transfer Level）設計方法論

> ***RTL 設計是思考電路結構，不是程式邏輯***
> 
> ***怎麼寫的就會怎麼合成出對應的電路，而不是只是跑邏輯流程。***

## 設計概念

RTL 設計描述的是**暫存器與資料流的關係**，著重在**時序邏輯**與**組合邏輯**的交錯應用。

### 主要構建元件
- 加法器（Adder）
- 減法器（Subtractor）  
- 比較器（Comparator）
- 多工器（Multiplexer）

## 常用運算子（Operators）

| 類別 | 範例 | 說明 |
|------|------|------|
| **算術** | `+`, `-` | 會合成為 adder/subtractor |
| **乘法** | `*` | 視 FPGA 支援（如 Artix-7 有乘法器） |
| **位移** | `>>`, `<<`, `>>>`, `<<<` | 分為邏輯與算術位移 |
| **比較** | `<`, `>`, `<=`, `>=`, `==`, `!=` | 合成比較器 |
| **位元運算** | `&`, `|`, `^`, `~` | 基本位元運算 |
| **邏輯運算** | `&&`, `||` | 邏輯判斷 |
| **連接** | `{a, b}` | 將向量合併 |
| **複製** | `{3{a}}` | 將 `a` 重複三次 |
| **條件** | `? :` | 是否滿足? (是所發生的事情):(否所發生的事情) |

## 特殊值

| 符號 | 說明 |
|------|------|
| `z` | 高阻抗（tri-state），常見於輸出控制 |
| `x` | 不關心（don't care），有助合成最佳化 |

## always 區塊（Procedural Block）

### assign / always block
>Verilog 中的 assign 是屬於**連續賦值（continuous assignment）**，設計上為「單一表達式」，像數學公式。
>它只能描述簡單的組合邏輯，不支援流程控制結（if、case、for 等）。

| 結構       | 對應概念    | 適合描述的硬體         |
| -------- | ------- | --------------- |
| `assign` | 單一邏輯表達式 | 簡單組合邏輯          |
| `always` | 程序性(行為性)流程   | 複雜條件邏輯、狀態機、計數器等 |

### **種類與建議用法**

| 類型 | 建議用法 | 賦值方式 |使用案例|
|------|----------|----------|---|
| 組合邏輯 | `@(*)` | 使用**阻塞賦值（=）** |組合邏輯電路（AND/OR/XOR 等閘）|
| 時序邏輯(有CLK關係) | `@(posedge clk)` | 使用**非阻塞賦值（<=）** |具有Filp - Flop時|

> 賦值方式的差異不是「運算順序」的問題，而是要合成哪一種電路元件的問題。

### 資料型態
- 組合邏輯或程序區塊中，需使用 `reg` 作為變數（`wire` 不能賦值於 always 區塊中）

## 條件語句與選擇語句

### if / else
- 可巢狀判斷，適合有邏輯優先順序的情境

### case / casez / casex
- `casez` 支援 `z` 和 `?` 為 don't-care
- `casex` 支援 `x`, `z`, `?` 為 don't-care  
- 建議搭配 `default` 分支

## 常見錯誤與準則

| 問題 | 建議解法 |
|------|----------|
| 多個 always 區塊賦值同一變數 | **每個變數只能在一個 always 中賦值** |
| 忘記 default 分支或輸出未賦值 | **初始化輸出變數**，避免 latch |
| 敏感列表不完整 | 使用 `@(*)`（Verilog-2001） |

## 常數與參數

| 類型 | 用途 | 說明 |
|------|------|------|
| `parameter` | 模組參數化設計 | 可在實例化時覆蓋 |
| `localparam` | 模組內部常數 | 無法從外部改變 |
