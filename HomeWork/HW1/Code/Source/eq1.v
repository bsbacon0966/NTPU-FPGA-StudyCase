module eq1
    (
    input wire A, B,
    output wire SUM,CARRY
    );
    assign SUM = A ^ B; // A XOR B 
    assign CARRY = A & B; // A AND B
endmodule
