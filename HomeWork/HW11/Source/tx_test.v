module uart_tx_test
   (
    input wire CLK_100M,        // clock
    input wire BTN_SOUTH,       // reset
    input wire BTN_CENTER,      // trigger transmit
    input wire [7:0] SWITCHES, // 8-bit switch inputs
    output wire TX             // UART transmit output
   );

   // Internal signal declarations
   wire s_tick;
   wire tx_done_tick;
   wire btn_tick;
   reg tx_start;
   reg [7:0] tx_data;
   
   // Baud rate generator: tick every 326 clock cycles for 9600 bps @ 100MHz
   mod_m_counter #(.M(326), .N(9)) baud_gen_unit
      (.clk(CLK_100M), .reset(BTN_SOUTH), .q(), .max_tick(s_tick));

   // Button debounce module
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
