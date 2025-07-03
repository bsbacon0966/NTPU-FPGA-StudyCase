module cos (
    input wire clk,
    input wire [5:0] addr,
    output reg signed [4:0] data   // 範圍 -15 ~ +15
);

reg [5:0] addr_tmp, addr_reg;
reg [3:0] data_tmp;

// 同步暫存器儲存 addr_tmp
always @(posedge clk) begin
    addr_reg <= addr_tmp;
end

// 角度對應處理（只要addr[4]==1，則需要對其addr做2補數才是要尋找的結果）
always @* begin
    case (addr[4])  // quadrant mirroring
        1'b0: addr_tmp = {addr[5:4], addr[3:0]};
        1'b1: addr_tmp = {addr[5:4], (~addr[3:0]) + 1'b1};
    endcase
end

// 轉換正負號輸出
always @* begin
    if(addr_reg[5]!=addr_reg[4]) data = (~{1'b0, data_tmp}) + 1'b1;
    else data = ({1'b0, data_tmp});
end

always @* begin
    case (addr_reg[3:0])
        4'h0:  data_tmp = (addr_reg[4]==1'b1) ? 4'd0  : 4'd15; // sin(0)=0 or sin(180)=0
        4'h1:  data_tmp = 4'd15;
        4'h2:  data_tmp = 4'd15;
        4'h3:  data_tmp = 4'd15;
        4'h4:  data_tmp = 4'd14;
        4'h5:  data_tmp = 4'd14;
        4'h6:  data_tmp = 4'd13;
        4'h7:  data_tmp = 4'd12;
        4'h8:  data_tmp = 4'd11;
        4'h9:  data_tmp = 4'd10;
        4'hA:  data_tmp = 4'd8;
        4'hB:  data_tmp = 4'd7;
        4'hC:  data_tmp = 4'd6;
        4'hD:  data_tmp = 4'd4;
        4'hE:  data_tmp = 4'd3;
        4'hF:  data_tmp = 4'd1; 
        default: data_tmp = 4'd0;
    endcase
end

endmodule
