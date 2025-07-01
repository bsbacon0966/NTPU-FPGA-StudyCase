module bin_to_bcd (
    input wire [3:0] bin_input,  // 4-bit binary input
    output reg [4:0] bcd_output  // 5-bit BCD output
);

reg [3:0] bin_temp;  

always @* begin
    bcd_output = 5'b00000;
    bin_temp = bin_input;
    
    if (bin_temp >= 4'b1010) begin  
        bcd_output[4] = 1'b1;          // 設置 BCD 的高位
        bin_temp = bin_temp - 4'b1010; // 減去 10（即 4'b1010）
    end
    
    bcd_output[3:0] = bin_temp[3:0]; 
end

endmodule
