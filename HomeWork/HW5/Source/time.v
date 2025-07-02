module slower_clock 
#(
    parameter N = 25,
    parameter M = 25000000  
)
(
    input wire clk,
    input wire reset,
    output wire slower_clk
);

    reg [N-1:0] r_reg;
    reg [N-1:0] r_next;
    reg clock;
    reg clock_next;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            r_reg <= 0;     
            clock <= 0;
        end else begin
            r_reg <= r_next;
            clock <= clock_next;
        end
    end

    // Next-state logic
    always @* begin
        if (r_reg == M - 1) begin
            r_next = 0;
            clock_next = ~clock;
        end else begin
            r_next = r_reg + 1;
            clock_next = clock;
        end
    end

    // Output logic
    assign slower_clk = clock;

endmodule
