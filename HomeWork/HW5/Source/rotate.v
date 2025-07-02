module rotate (
    input wire slower_clk,        
    input wire rotate_reset,      
    output wire [7:0] rotate_data  
);
    reg [7:0] r_current;
    reg [7:0] r_next;
    
    initial begin
        r_current = 8'b10000000;  // 設置初始值
    end
    
    always @(posedge slower_clk or posedge rotate_reset) begin //Register slower_clk 上升緣時觸發 (時序邏輯)
        if (rotate_reset) 
            r_current <= 8'b10000000; //重設時，將 r_current 設為預設值
        else
            r_current <= r_next; //將 r_next 的值存入 r_current 中
    end

    always @* begin // next-state logic : 更新 r_next 的值
        r_next = {r_current[0], r_current[7:1]};
    end
    
    assign rotate_data = r_current; //輸出邏輯 : module輸出的值即是r_current的值
endmodule
