`timescale 1ns / 1ps

module tennis(
    input wire [3:0] tennis_input,  // 4-bit input
    output reg [7:0] tennis_output  // 8-bit output
);
always @* begin
    tennis_output = 8'b11111110; //初始化
    case(tennis_input)
        4'b0000: tennis_output = 8'b11110000;
        4'b0001: tennis_output = 8'b00010101;
        4'b0011: tennis_output = 8'b00110000;
        4'b0111: tennis_output = 8'b01000000;
        4'b1111: tennis_output = 8'b11111010;
    endcase
end
endmodule
