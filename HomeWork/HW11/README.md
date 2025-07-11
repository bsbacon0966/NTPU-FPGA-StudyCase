# 題目
![alt text](image-1.png)
# 解法與程式碼說明
教授有提供uart_tx.v檔案，所以我們的目標是怎麼整理資料並與uart_tx.v對接就好，只要對接成功，就可以讓FPGA當作發送端發送資訊出去
題目要求是透過Switch去調要傳輸的資料，並按下按鈕時發送

```Verilog
module uart_tx_test
   (
    input wire CLK_100M,        // clock
    input wire BTN_SOUTH,       // reset
    input wire BTN_CENTER,      // trigger transmit
    input wire [7:0] SWITCHES, // 8-bit switch inputs
    output wire TX             // UART transmit output
   );

   wire s_tick;
   wire tx_done_tick;
   wire btn_tick;
   reg tx_start;
   reg [7:0] tx_data;
   
   // Baud rate generator: tick every 326 clock cycles for 9600 bps @ 100MHz
   mod_m_counter #(.M(326), .N(9)) baud_gen_unit
      (.clk(CLK_100M), .reset(BTN_SOUTH), .q(), .max_tick(s_tick));

   db_fsmd_imp btn_db_unit
      (.clk(CLK_100M), .reset(BTN_SOUTH), .sw(BTN_CENTER),
       .db_level(), .db_tick(btn_tick));

   // UART transmitter instance
   uart_tx uart_tx_unit
      (
       .clk(CLK_100M),
       .reset(BTN_SOUTH),
       .tx_start(btn_tick),
       .s_tick(s_tick),
       .din(SWITCHES),           // Send the tx_data
       .tx_done_tick(tx_done_tick),
       .tx(TX)
      );


endmodule
```

只要XDC檔案讓8個Switch對接上這個module的input就可以了