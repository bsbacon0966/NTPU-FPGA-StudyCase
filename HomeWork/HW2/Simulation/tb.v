`timescale 1ns / 1ps

module tb;

    // Declare test signals
    reg [1:0] test_in0, test_in1;
    wire [2:0] out;

    // Instantiate the 'combine' module
    combine uut (
        .test1(test_in0),
        .test2(test_in1),
        .output_answer(out)
    );

    // Initial block to apply test inputs
    initial begin
        // Initialize inputs
        test_in0 = 2'b00;test_in1 = 2'b00;
        #10 test_in0 = 2'b00; test_in1 = 2'b01; // Apply first test case
        #10 test_in0 = 2'b00; test_in1 = 2'b10; // Apply second test case
        #10 test_in0 = 2'b00; test_in1 = 2'b11; // Apply third test case
        #10 test_in0 = 2'b01;test_in1 = 2'b00;
        #10 test_in0 = 2'b01; test_in1 = 2'b01; // Apply first test case
        #10 test_in0 = 2'b01; test_in1 = 2'b10; // Apply second test case
        #10 test_in0 = 2'b01; test_in1 = 2'b11; // Apply third test case
        #10 test_in0 = 2'b10;test_in1 = 2'b00;
        #10 test_in0 = 2'b10; test_in1 = 2'b01; // Apply first test case
        #10 test_in0 = 2'b10; test_in1 = 2'b10; // Apply second test case
        #10 test_in0 = 2'b10; test_in1 = 2'b11; // Apply third test case
        #10 test_in0 = 2'b11;test_in1 = 2'b00;
        #10 test_in0 = 2'b11; test_in1 = 2'b01; // Apply first test case
        #10 test_in0 = 2'b11; test_in1 = 2'b10; // Apply second test case
        #10 test_in0 = 2'b11; test_in1 = 2'b11; // Apply third test case
        // End simulation
        #10 $finish;
    end

endmodule
