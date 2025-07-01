`timescale 1ns / 1ps

module combine(
    input wire[1:0] test1, test2,
    output wire[2:0] output_answer
    );
    
    wire first_bit_sum, first_bit_carry;
    
    half_adder first_bit(
        .hA(test1[0]),
        .hB(test2[0]),
        .hSUM(output_answer[0]),
        .hCARRY(first_bit_carry)
    );
    
    full_adder second_bit(
        .fA(test1[1]),
        .fB(test2[1]),
        .Cin(first_bit_carry),
        .fSUM(output_answer[1]),
        .fCARRY(output_answer[2])
    );
    
endmodule
