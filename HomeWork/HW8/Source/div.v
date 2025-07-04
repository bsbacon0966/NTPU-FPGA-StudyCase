module div #(parameter W=4, CBIT=5) // CBIT= W + 1
(
    input wire clk, reset,
    input wire start,
    input wire [W-1:0] dvsr, dvnd,
    output reg ready, done_tick,
    output wire [W-1:0] quo, rmd
);

    // symbolic state declaration
    localparam [1:0] idle = 2'b00,
                       op   = 2'b01,
                       last = 2'b10,
                       done = 2'b11;

    // signal declaration
    reg [1:0] state_reg, state_next;
    reg [W-1:0] rh_reg, rh_next, rl_reg, rl_next, rh_tmp;
    reg [W-1:0] d_reg, d_next;
    reg [CBIT-1:0] n_reg, n_next;
    reg q_bit;

    // FSMD state & data registers
    always @(posedge clk, posedge reset)
        if (reset) begin
            state_reg <= idle;
            rh_reg    <= 0;
            rl_reg    <= 0;
            d_reg     <= 0;
            n_reg     <= 0;
        end
        else begin
            state_reg <= state_next;
            rh_reg    <= rh_next;
            rl_reg    <= rl_next;
            d_reg     <= d_next;
            n_reg     <= n_next;
        end

    // FSMD next-state logic
    always @* begin
        state_next = state_reg;
        ready      = 1'b0;
        done_tick  = 1'b0;
        rh_next    = rh_reg;
        rl_next    = rl_reg;
        d_next     = d_reg;
        n_next     = n_reg;

        case (state_reg)
        idle: begin
            ready = 1'b1;
            if (start) begin
                rh_next = { {(W-1){1'b0}}, dvnd[W-1] }; // 預先將被除數的MSB移至rh的LSB
                rl_next = {dvnd[W-2:0], 1'b0};  // 位移rl並在LSB放入0，因為Q在一開始必定為0，0/dvsr = 0
                d_next = dvsr;   // 除數
                n_next = CBIT - 1;   // 因為已預先執行一次，所以減少一次計數
                state_next = op;
            end
        end


            op: begin
                // shift rh and rl left
                rl_next = {rl_reg[W-2:0], q_bit};
                rh_next = {rh_tmp[W-2:0], rl_reg[W-1]};
                // decrease index
                n_next = n_reg - 1;
                if (n_next == 1)
                    state_next = last;
            end

            last: begin // last iteration
                rl_next    = {rl_reg[W-2:0], q_bit};
                rh_next    = rh_tmp;
                state_next = done;
            end

            done: begin
                done_tick  = 1'b1;
                state_next = idle;
            end

            default: state_next = idle;
        endcase
    end

    // compare and subtract circuit
    always @*
        if (rh_reg >= d_reg) begin
            rh_tmp = rh_reg - d_reg;
            q_bit  = 1'b1;
        end
        else begin
            rh_tmp = rh_reg;
            q_bit  = 1'b0;
        end

    // output
    assign quo = rl_reg;
    assign rmd = rh_reg;

endmodule