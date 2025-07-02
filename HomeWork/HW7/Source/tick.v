module tick #(
    parameter N = 20  // N-bit counter, generates tick every 2^N cycles
)(
    input  wire clock,     // System clock
    input  wire reset,     // Asynchronous reset
    output wire m_tick     // Tick output
);
    // Internal signal declaration
    reg [N-1:0] q_reg;      // Register to hold current count
    wire [N-1:0] q_next;    // Next state logic
    
    // Register logic: reset to 1 not 0, so it can cycle through 0
    always @(posedge clock or posedge reset) begin
        if (reset)
            q_reg <= 1;  // Start from 1 instead of 0
        else
            q_reg <= q_next;
    end
    
    // Next state logic: increment the counter
    assign q_next = q_reg + 1;
    
    // Output logic: generate tick when counter is 0 (just rolled over)
    assign m_tick = (q_reg == 0) ? 1'b1 : 1'b0;
endmodule