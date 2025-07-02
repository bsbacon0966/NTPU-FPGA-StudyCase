// Debouncing FSM
module db_fsm(
    input wire clk,
    input wire reset,
    input wire sw,
    output reg db,
    output wire dbg_tick  // 新增的 tick 輸出，用於模擬觀察
);

// Symbolic state declaration
localparam [2:0] zero     = 3'b000,
                 wait1_1  = 3'b001,
                 wait1_2  = 3'b010,
                 wait1_3  = 3'b011,
                 one      = 3'b100,
                 wait0_1  = 3'b101,
                 wait0_2  = 3'b110,
                 wait0_3  = 3'b111;

// Signal declaration
reg [2:0] state_reg, state_next;
wire m_tick;  // Tick signal from the counter

// Generation of a tick with period 10ms ~= 2^20 * 10ns (for simulation you can use #(10) instead)
tick #(20) tick_10ms (
    .clock(clk),
    .reset(reset),
    .m_tick(m_tick)
);


// State register
always @(posedge clk, posedge reset) begin
    if (reset)
        state_reg <= zero;
    else
        state_reg <= state_next;
end

// Next-state logic
always @* begin
    state_next = state_reg;  // Default: stay
    case (state_reg)
    
        zero:
            if (sw==1) state_next = wait1_1;
        wait1_1:
            if (m_tick) state_next = wait1_2;
        wait1_2:
            if (m_tick) state_next = wait1_3;
        wait1_3:
            if (m_tick) begin
                if (sw==1)
                    state_next = one;
                else
                    state_next = zero;
            end
            
            
        one:
            if (sw==0) state_next = wait0_1;
        wait0_1:
            if (m_tick) state_next = wait0_2;
        wait0_2:
            if (m_tick) state_next = wait0_3;
        wait0_3:
            if (m_tick) begin
                if (sw==0)
                    state_next = zero;
                else
                    state_next = one;
            end

        default:
            state_next = zero;
    endcase
end

// Output tick
assign dbg_tick = m_tick;
// Output logic
always @* begin
    case (state_reg)
        zero, wait0_1, wait0_2, wait0_3:
            db = 1'b0;
        one, wait1_1, wait1_2, wait1_3:
            db = 1'b1;
        default:
            db = 1'b0;
    endcase
end

endmodule
