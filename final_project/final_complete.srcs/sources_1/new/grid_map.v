module GridMap (
    input clk,
    input reset,
    input update_enable, // tick_counter == 32_000_000 時拉高
    input [3:0] grid_x,
    input [3:0] grid_y,
    output [2:0] grid_value
);
    reg [2:0] grid_matrix [0:191];
    wire [7:0] grid_index = grid_x + grid_y * 16;
    integer i, row_idx, base;
    reg [2:0] temp;
    
    // 查詢地圖值
    assign grid_value = (grid_x < 16 && grid_y < 12) ? grid_matrix[grid_index] : 3'b000;
    
    // 地圖初始化與更新
    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            // 初始化所有格子為空
            for (i = 0; i < 192; i = i + 1)
                grid_matrix[i] <= 3'b000;
            
            // 設定安全區域 (第一排和最後一排)
            for (i = 0; i < 16; i = i + 1)
                grid_matrix[i] <= 3'b001;
            
            // 設定移動障礙物 (第2-7排，間隔9)
            for (i = 16; i < 105; i = i + 9)
                if (i + 2 < 176) begin
                    grid_matrix[i]   <= 3'b010;
                    grid_matrix[i+1] <= 3'b010;
                    grid_matrix[i+2] <= 3'b010;
                end
            
            // 設定移動障礙物 (第7-11排，間隔7)
            for (i = 105; i < 176; i = i + 7) begin
                grid_matrix[i]   <= 3'b010;
                grid_matrix[i+1] <= 3'b010;
                grid_matrix[i+2] <= 3'b010;
            end
            for (i = 176; i < 192; i = i + 1)
                grid_matrix[i] <= 3'b001;
        end else if (update_enable) begin
            // 更新移動障礙物位置 (跳過第0排和第11排)
            for (row_idx = 1; row_idx <= 10; row_idx = row_idx + 1) begin
                base = row_idx * 16;
                if (row_idx % 2 == 0) begin
                    // 偶數排向右移動
                    temp = grid_matrix[base];
                    for (i = 0; i < 15; i = i + 1)
                        grid_matrix[base + i] <= grid_matrix[base + i + 1];
                    grid_matrix[base + 15] <= temp;
                end else begin
                    // 奇數排向左移動
                    temp = grid_matrix[base + 15];
                    for (i = 15; i > 0; i = i - 1)
                        grid_matrix[base + i] <= grid_matrix[base + i - 1];
                    grid_matrix[base] <= temp;
                end
            end
        end
    end
endmodule