module combine_logic (
    input wire initial_clk,            // 原始時鐘，例如板子的50MHz時鐘
    input wire initial_reset,          // 全域 reset
    output wire [7:0] rotate_answer // 旋轉輸出資料
);

    wire slower_clk;
     
    slower_clock #(25,25000000) u_slower_clock (
        .clk(initial_clk),
        .reset(initial_reset),
        .slower_clk(slower_clk)
    );

    rotate u_rotate (
        .slower_clk(slower_clk),
        .rotate_reset(initial_reset),
        .rotate_data(rotate_answer)
    );

endmodule
