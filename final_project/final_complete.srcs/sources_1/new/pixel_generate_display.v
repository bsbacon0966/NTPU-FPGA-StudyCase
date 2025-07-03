module PixelGen(
    input clk,
    input reset,
    input [9:0] pixel_x,
    input [9:0] pixel_y,
    input [2:0] grid_value,
    input [3:0] frog_x,
    input [3:0] frog_y,
    input [2:0] frog_dir,
    input game_win,         
    output reg [3:0] R,
    output reg [3:0] G,
    output reg [3:0] B
);
    localparam GRID_SIZE = 40;
    
    // ===== 目的:判斷當前的青蛙顯示區域在哪裡，以及寫一個bool確定甚麼時候要畫他
    reg frog_pixel_valid;
    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            frog_pixel_valid <= 0;
        end else begin
            frog_pixel_valid <= 
                (pixel_x > frog_x * GRID_SIZE) && (pixel_x <= (frog_x + 1) * GRID_SIZE) &&
                (pixel_y >= frog_y * GRID_SIZE) && (pixel_y < (frog_y + 1) * GRID_SIZE); // 在目標GRID下就要畫
        end
    end
    
    // pixel 在格子中的位置
    wire [5:0] local_x = pixel_x % GRID_SIZE;
    wire [5:0] local_y = pixel_y % GRID_SIZE;
    wire [11:0] pixel_offset = local_y * GRID_SIZE + local_x;
 
    // ====== 目的 : 讓勝利圖片可以至中  =======
    localparam win_width = 200;   
    localparam win_height = 100;  
    localparam win_SX = (640 - win_width) / 2;   // 水平居中
    localparam win_SY = (480 - win_height) / 2;  // 垂直居中
    localparam win_EX = win_SX + win_width - 1;
    localparam win_EY = win_SY + win_height - 1;
    // ====== 目的 : 讓勝利圖片可以至中  =======
    
    // 判断是否是顯示勝利圖片的區域
    wire win_pixel_valid = (pixel_x >= win_SX) && (pixel_x <= win_EX) &&
                          (pixel_y >= win_SY) && (pixel_y <= win_EY);
    
    // 判斷勝利圖片要讀取哪一個ROM中的index值
    wire [9:0] win_local_x = pixel_x - win_SX;
    wire [9:0] win_local_y = pixel_y - win_SY;
    wire [17:0] win_pixel_offset = win_local_y * win_width + win_local_x;
    
    
    // ==== 三個東西ROM初始化 ==== 
    reg [14:0] frog_rom_addr; // 查找地址
    reg is_wood;
    wire [11:0] frog_douta; // 查找地址後的值
    
    image_rom frog_rom (
        .clka(clk),
        .addra(frog_rom_addr),
        .douta(frog_douta)
    );
    
    reg [14:0] map_rom_addr;// 查找地址
    wire [11:0] map_douta;// 查找地址後的值
    image_rom2 map_rom (
        .clka(clk),
        .addra(map_rom_addr),
        .douta(map_douta)
    );
    
    reg [17:0] win_rom_addr; // 查找地址
    wire [11:0] win_douta;// 查找地址後的值
    you_win_rom win_rom (
        .clka(clk),
        .addra(win_rom_addr),
        .douta(win_douta)
    );
    // ==== 三個東西ROM初始化 ==== 
    
    // ===== 目的:地址計算法 =========
    always @(*) begin
        is_wood = (grid_value == 3'b010); 
        frog_rom_addr = is_wood * 4 * GRID_SIZE * GRID_SIZE + frog_dir * GRID_SIZE * GRID_SIZE + pixel_offset;
        // 青蛙共有八張圖片，所以先判斷是木頭還是安全區，然後判斷當前方位，然後在找當下pixel的精確值
        map_rom_addr = grid_value * GRID_SIZE * GRID_SIZE + pixel_offset;
        win_rom_addr = win_pixel_offset;
    end
    // ===== 目的:地址計算法 =========
    
    // ======== 輸出邏輯，WIN>青蛙>地圖 ===========
    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            R <= 0; G <= 0; B <= 0;
        end else begin
            if (game_win && win_pixel_valid) begin // 勝利 + 要顯示圖片的區域
                R <= win_douta[11:8];
                G <= win_douta[7:4];
                B <= win_douta[3:0];
            end else if (game_win && !win_pixel_valid) begin // 勝利 + 不須顯示圖片的區域
                R <= 4'b0000; G <= 4'b0000; B <= 4'b0000;
                
            end else if (frog_pixel_valid) begin
                // 顯示青蛙的的位置與圖片
                R <= frog_douta[11:8];
                G <= frog_douta[7:4];
                B <= frog_douta[3:0];
            end else begin
                // 顯示地圖的的圖片
                R <= map_douta[11:8];
                G <= map_douta[7:4];
                B <= map_douta[3:0];
            end
        end
    end
    // ======== 輸出邏輯，WIN>青蛙>地圖 ===========
endmodule