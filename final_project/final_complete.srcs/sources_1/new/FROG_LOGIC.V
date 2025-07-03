module FROG_LOGIC (
    input clk,
    input reset,
    input update_grid,
    input up,
    input down,
    input left,
    input right,
    input [2:0] current_grid_value,
    output reg [3:0] frog_x,
    output reg [3:0] frog_y,
    output reg [2:0] frog_dir
);
    
    
    reg [1:0] state, next_state; // 當前青蛙地朝向
    localparam IDLE = 2'b00, // FSM : 判斷當前青蛙應該要做甚麼事情
               DROWN_CHECK = 2'b01;

    // 暫存 next-position 和 next-direction
    reg [3:0] next_frog_x;
    reg [3:0] next_frog_y;
    reg [2:0] next_frog_dir;

    // FSM
    always @(*) begin
        // 預設值
        next_state = state;
        next_frog_x = frog_x;
        next_frog_y = frog_y;
        next_frog_dir = frog_dir;

        case(state)
            IDLE: begin // 代表玩家都還沒動作，可以隨時監聽玩家是否按下移動按鈕
                if (up && frog_y > 0) begin // 往上走
                    next_frog_y = frog_y - 1;
                    next_frog_dir = 3'b000;
                    next_state = DROWN_CHECK;
                end else if (down && frog_y < 11) begin// 往下走
                    next_frog_y = frog_y + 1;
                    next_frog_dir = 3'b010;
                    next_state = DROWN_CHECK;
                end else if (left && frog_x > 0) begin// 往左走
                    next_frog_x = frog_x - 1;
                    next_frog_dir = 3'b011;
                    next_state = DROWN_CHECK;
                end else if (right && frog_x < 15) begin// 往右走
                    next_frog_x = frog_x + 1;
                    next_frog_dir = 3'b001;
                    next_state = DROWN_CHECK;
                end 
                else if (update_grid) begin // 當此訊號tick，代表當前木頭正在移動，木頭移動時也需要更新青蛙位置，判斷方式跟木頭飄移一樣
                    if (frog_y > 0 && frog_y < 11 && current_grid_value == 3'b010) begin
                        if (frog_y % 2 == 0) begin
                            next_frog_x = (frog_x > 0) ? frog_x - 1 : 0;
                        end else begin
                            next_frog_x = (frog_x < 15) ? frog_x + 1 : 15;
                        end
                    end
                    if (frog_y > 0 && frog_y < 11) begin
                        next_state = DROWN_CHECK;
                    end
                end
            end

            DROWN_CHECK: begin //會需要獨立分出 DROWN_CHECK，是為了讓地圖更新能更新到新的值
            // 第一時間 : 當update_grid tick時，地圖的值跟青蛙的座標都會有變化，所以需要先更新完之後，才能對其進行判斷青蛙的座標是否是木頭
            // 第二時間 : 現在青蛙的FSM是 DROWN_CHECK ，對當前地圖去查詢是否當前座標是木頭
                if (frog_y > 0 && frog_y < 11 && current_grid_value == 3'b000) begin // 如果是水
                    next_frog_x = 4'd11; // 初始化青蛙的座標，回到安全區
                    next_frog_y = 4'd11;
                    next_frog_dir = 3'b000;
                end
                next_state = IDLE;
            end

            default: begin
                next_state = IDLE;
            end
        endcase
    end

    // 狀態與輸出更新
    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            state <= IDLE;
            frog_x <= 4'd11;
            frog_y <= 4'd11;
            frog_dir <= 3'b000;
        end else begin
            state <= next_state;
            frog_x <= next_frog_x;
            frog_y <= next_frog_y;
            frog_dir <= next_frog_dir;
        end
    end

endmodule