`timescale 1 ns/10 ps // simulation time unit/timestep
module eq1_testbench;
    // signal declaration
    reg [1:0] test_in0, test_in1;
    wire test_out_SUM,test_out_CARRY;
    eq1 adder (test_in0, test_in1, test_out_SUM ,test_out_CARRY);
    // test vector generator
    initial
        begin
        // test vector 0/0
        test_in0 = 1'b0;
        test_in1 = 1'b0;
        # 200; 
        // test vector 0/1
        test_in0 = 1'b0;
        test_in1 = 1'b1;
        # 200; 
        // test vector 1/0
        test_in0 = 1'b1;
        test_in1 = 1'b0;
        # 200; 
        // test vector 1/1
        test_in0 = 1'b1;
        test_in1 = 1'b1;
        # 200;
        $stop;
    end
endmodule