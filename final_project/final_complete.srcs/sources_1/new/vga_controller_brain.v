module VGAController(
    input CLK_100M,
    input RESET,
    input btn_up,
    input btn_down,
    input btn_left,
    input btn_right,
    output vga_hs_pin,
    output vga_vs_pin,
    output [3:0] vga_R_Data_pin,
    output [3:0] vga_G_Data_pin,
    output [3:0] vga_B_Data_pin
);

wire VGA_clk;
wire [9:0] pixel_x;
wire [9:0] pixel_y;

// VGA時鐘生成
VGAClk252 vga_clk_252(
    .clk_in1(CLK_100M),
    .resetn(RESET),
    .clk_out1(VGA_clk),
    .locked()
);

// VGA同步信號
VGASync vga_sync(
    .clk(VGA_clk),
    .reset(RESET),
    .hsync(vga_hs_pin),
    .vsync(vga_vs_pin),
    .pixel_x(pixel_x),
    .pixel_y(pixel_y)
);

// 當前FROG的地址，在grid_map中的grid_map[frog_x][frog_y]
wire [3:0] frog_x;
wire [3:0] frog_y;
wire [2:0] frog_dir;// 當前FROG的方向，分成上左下右
wire [3:0] grid_x = pixel_x / 40; // 將(640,480)分割成 16*12 的 40*40 方格
wire [3:0] grid_y = pixel_y / 40;

// 集中式地圖資料
reg [2:0] game_grid [0:191]; // 所有方格所代表的質都放在這裡
reg [2:0] next_game_grid [0:191]; // 下一次木頭移動更新的執會先放到這邊

wire [7:0] display_grid_index = grid_x + grid_y * 16; //因為vivado中沒有二微陣列的概念，所以只能 y 座標 * 16 + X座標
wire [2:0] display_grid_value = game_grid[display_grid_index]; //去找當前pixel_X和pixel_Y指向的代表格的值是多少


wire [7:0] frog_grid_index = frog_x + frog_y * 16; //因為vivado中沒有二微陣列的概念，所以只能 y 座標 * 16 + X座標
wire [2:0] frog_grid_value =  game_grid[frog_grid_index];

// 時間控制
reg [27:0] tick_counter;
reg update_grid_reg;
wire update_grid = update_grid_reg;

// ===== 目的 : 拉長木頭飄動的更新時間(放慢時脈) =========
always @(posedge VGA_clk or negedge RESET) begin
    if (!RESET) begin
        tick_counter <= 0;
        update_grid_reg <= 0;
    end else if (tick_counter >= 27'd32_000_000) begin
        tick_counter <= 0;
        update_grid_reg <= 1;
    end else begin
        tick_counter <= tick_counter + 1;
        update_grid_reg <= 0;
    end
end
// ===== 目的 : 拉長木頭飄動的更新時間(放慢時脈) =========

// ===== 目的 : 判斷木頭標動的邏輯 =========
integer i, row_idx, base;
reg [2:0] temp;
always @(*) begin
    // 預設不變
    for (i = 0; i < 192; i = i + 1) begin
        next_game_grid[i] = game_grid[i];
    end

    if (update_grid) begin
        for (row_idx = 1; row_idx <= 10; row_idx = row_idx + 1) begin // 地圖只有 Y = 1 - 10之間才需要判斷移動
            base = row_idx * 16; // 一個row會有16個個子，所以16為一組去判斷
            if (row_idx % 2 == 0) begin // 偶數行向左移動
                temp = game_grid[base]; // 記住最左邊的值
                for (i = 0; i < 15; i = i + 1)
                    next_game_grid[base + i] = game_grid[base + i + 1]; // 所有當前組別格子都往index-1的方向移動
                next_game_grid[base + 15] = temp; // 最左邊的值放到最右邊
            end else begin // 奇數行向右移動
                temp = game_grid[base + 15];// 記住最右邊的值
                for (i = 15; i > 0; i = i - 1)
                    next_game_grid[base + i] = game_grid[base + i - 1]; // 所有當前組別格子都往index-1的方向移動
                next_game_grid[base] = temp;// 最右左邊的值放到最左邊
            end
        end
    end
end
// ===== 目的 : 判斷木頭標動的邏輯 =========

// ===== 目的 : 初始化當前地圖 =========
always @(posedge VGA_clk or negedge RESET) begin
    if (!RESET) begin
        for (i = 0; i < 192; i = i + 1)
            game_grid[i] <= 3'b000; // 先初始化所有人都是河流
            
        for (i = 0; i < 16; i = i + 1)
            game_grid[i] <= 3'b001; // 第一row是一般地板
            
        for (i = 16; i < 105; i = i + 9) begin // 生成木頭，一定間格才生成木頭
            if (i + 2 < 176) begin
                game_grid[i]   <= 3'b010;
                game_grid[i+1] <= 3'b010;
                game_grid[i+2] <= 3'b010;
            end
        end
        
        for (i = 105; i < 176; i = i + 7) begin // 生成木頭，一定間格才生成木頭
            game_grid[i]   <= 3'b010;
            game_grid[i+1] <= 3'b010;
            game_grid[i+2] <= 3'b010;
        end
        
        for (i = 176; i < 192; i = i + 1)
            game_grid[i] <= 3'b001; // 最後一row是一般地板
        
        game_grid[6] <= 3'b011;
    end else begin
        for (i = 0; i < 192; i = i + 1)
            game_grid[i] <= next_game_grid[i];
    end
end
// ===== 目的 : 初始化當前地圖 =========

// ==== 目的:按鈕防彈跳 ========
wire btn_up_tick, btn_down_tick, btn_left_tick, btn_right_tick;
db_fsmd_imp db_up (.clk(VGA_clk), .reset(~RESET), .sw(btn_up), .db_level(), .db_tick(btn_up_tick));
db_fsmd_imp db_down (.clk(VGA_clk), .reset(~RESET), .sw(btn_down), .db_level(), .db_tick(btn_down_tick));
db_fsmd_imp db_left (.clk(VGA_clk), .reset(~RESET), .sw(btn_left), .db_level(), .db_tick(btn_left_tick));
db_fsmd_imp db_right (.clk(VGA_clk), .reset(~RESET), .sw(btn_right), .db_level(), .db_tick(btn_right_tick));
// ==== 目的:按鈕防彈跳 ========

// ==== 目的:青蛙移動邏輯 ========
FROG_LOGIC frog_logic_inst (
    .clk(VGA_clk),
    .reset(RESET),
    .update_grid(update_grid),
    .up(btn_up_tick),
    .down(btn_down_tick),
    .left(btn_left_tick),
    .right(btn_right_tick),
    .current_grid_value(frog_grid_value),
    .frog_x(frog_x),
    .frog_y(frog_y),
    .frog_dir(frog_dir)
);
// ==== 目的:青蛙移動邏輯 ========

reg game_win; // 判斷勝利的條件，只要frog到一定的座標就算獲勝
wire win_condition = (frog_x == 4'd6) && (frog_y == 4'd0);

// ==== 目的:是否要結束遊戲(玩家是否走到指定格子並準備宣告勝利) ========
always @(posedge VGA_clk or negedge RESET) begin
    if (!RESET) begin
        game_win <= 0;
    end else if (win_condition) begin
        game_win <= 1;
    end
end
// ==== 目的:是否要結束遊戲(玩家是否走到指定格子並準備宣告勝利) ========


// ==== 目的:畫面生成 ========
PixelGen pixel_gen(
    .clk(VGA_clk),
    .reset(RESET),
    .pixel_x(pixel_x),
    .pixel_y(pixel_y),
    .grid_value(display_grid_value),
    .frog_x(frog_x),
    .frog_y(frog_y),
    .frog_dir(frog_dir),
    .game_win(game_win),
    .R(vga_R_Data_pin),
    .G(vga_G_Data_pin),
    .B(vga_B_Data_pin)
);
// ==== 目的:畫面生成 ========

endmodule
