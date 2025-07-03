module fifo_test (
    input  wire        CLK_100M,
    input  wire        BTN_SOUTH,
    input  wire        BTN_EAST,
    input  wire        BTN_WEST,
    input  wire [3:0]  switch,
    output wire [7:0]  LED
);

    wire east_tick;
    wire west_tick;

    // Debounce circuit for BTN_WEST (read)
    db_fsmd_imp btn_db_unit0 (
        .clk(CLK_100M),
        .reset(BTN_SOUTH),
        .sw(BTN_WEST),
        .db_level(),         // Not used
        .db_tick(west_tick)
    );

    // Debounce circuit for BTN_EAST (write)
    db_fsmd_imp btn_db_unit1 (
        .clk(CLK_100M),
        .reset(BTN_SOUTH),
        .sw(BTN_EAST),
        .db_level(),         // Not used
        .db_tick(east_tick)
    );

    // Instantiate a 2^2-depth by 4-bit wide FIFO
    fifo #(
        .B(4),    // data width
        .E(2),    // address bits: depth = 2^2 = 4
        .W(2)     // unused/extra param, check if needed
    ) fifo_unit (
        .clk(CLK_100M),
        .reset(BTN_SOUTH),
        .rd(west_tick),
        .wr(east_tick),
        .w_data(switch),
        .r_data(LED[3:0]),
        .full(LED[7]),
        .empty(LED[6])
    );

    // Disable unused LEDs
    assign LED[5:4] = 2'b00;

endmodule
