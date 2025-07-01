module full_adder
    (
    input wire fA, fB,Cin,
    output wire fSUM,fCARRY
    );
    wire IN_SUM, IN_CARRY;
    assign IN_SUM = fA ^ fB; // A XOR B 
    assign IN_CARRY = fA & fB; // A AND B
    assign CARRY = IN_SUM & Cin;
    assign fSUM = IN_SUM ^ Cin;
    assign fCARRY = CARRY | IN_CARRY;
endmodule
