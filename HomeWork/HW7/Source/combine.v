module debounce_test (
    input wire CLK_100M,
    input wire BTN_SOUTH,
    input wire BTN_CENTER,
    output wire [7:0] LED
);

    // signal declaration
    reg [7:0] b_reg, b_next;
    wire db_level,tick_is_on;
    reg db_reg, db_next;

    // debounce module instance
    db_fsm db_unit (
        .clk(CLK_100M),
        .reset(BTN_SOUTH),
        .sw(BTN_CENTER),
        .db(db_level),
        .dbg_tick(tick_is_on)
    );

    // register logic
    always @(posedge CLK_100M) begin
        if (BTN_SOUTH) begin
            b_reg <= 8'h01;
            db_reg <= 1'b0;
        end else begin
            b_reg <= b_next;
            db_reg <= db_next;
        end
    end

    // next-state logic
    always @* begin
        if ((db_reg == 1'b0) && (db_level == 1'b1)) begin
            b_next = {b_reg[6:0], b_reg[7]}; // rotate left
            db_next = 1'b1;
        end else if ((db_reg == 1'b1) && (db_level == 1'b0)) begin
            db_next = 1'b0;
            b_next = b_reg;
        end else begin
            db_next = db_reg;
            b_next = b_reg;
        end
    end

    // output logic
    assign LED = b_reg;

endmodule
