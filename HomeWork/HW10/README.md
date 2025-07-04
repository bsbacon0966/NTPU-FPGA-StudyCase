# 題目
![alt text](image.png)

# 解法與程式碼說明
此題目目的在於，如果我現在希望Table只能存放16個資料的情況下，我要如何表示[ 000000 - 111111 ] = [0 , 2*pi] 的資料
-> 及需要分析COS的特性


## 特性分析
```Verilog
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
```
cos波形中，第二三象限的值皆為負數，所以[01XXXX]跟[10XXXX]的Data都要轉為負數表示
且第二向限的值 = 第一向限的地址2補數；第四向限的值 = 第三向限的地址2補數

```Verilog
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
```
只要這樣做轉換，就可以只建立2^4 to 4 look-up table下，仍舊能畫出[0 - 2*pi]的波形了。