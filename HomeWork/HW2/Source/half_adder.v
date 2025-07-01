module half_adder
    (
    input wire hA, hB,
    output wire hSUM,hCARRY
    );
    assign hSUM = hA ^ hB; // A XOR B 
    assign hCARRY = hA & hB; // A AND B
endmodule
