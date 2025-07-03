module VGASync(
		input	clk,
		input	reset,
		output	reg	hsync,
		output	reg	vsync,
		output	[9:0] pixel_x,
		output	[9:0] pixel_y
	);
	
	//640*480
	parameter H_sync_end = 96;		
	parameter V_sync_end = 2;		
	parameter H_sysc_Total = 800;	
	parameter V_sysc_Total = 525;	
	parameter H_Show_Start = 144;	
	parameter V_Show_Start = 35;		
	
	// 800* 600
	// parameter H_sync_end = 120;
	// parameter V_sync_end = 6;
	// parameter H_sysc_Total = 1040;
	// parameter V_sysc_Total = 666;
	// parameter H_Show_Start = 184;
	// parameter V_Show_Start = 29;
	
	reg [10:0]	x_cnt, x_cnt_next;
	reg [9:0]	y_cnt, y_cnt_next;
	reg hsync_next, vsync_next;
	
always@(posedge clk, negedge reset)
	begin
		if (!reset)
		begin
			x_cnt <= 11'd0;
			y_cnt <= 10'd0;
			hsync <= 1'b0;
			vsync <= 1'b0;
		end
		else 
		begin
		    x_cnt <= x_cnt_next;
		    y_cnt <= y_cnt_next;
		    hsync <= hsync_next;
		    vsync <= vsync_next;
		end
    end
		
    always @*
    begin
        x_cnt_next = x_cnt;
        y_cnt_next = y_cnt;
        hsync_next = hsync;
        vsync_next = vsync;
        if (x_cnt == H_sysc_Total)
			x_cnt_next = 11'd0;
		else 
			x_cnt_next = x_cnt + 1'b1;
        
        if (y_cnt == V_sysc_Total)
			y_cnt_next = 10'd0;
		else if(x_cnt == H_sysc_Total)
			y_cnt_next = y_cnt + 1'b1;
			
		if (x_cnt == 11'd0)
			hsync_next = 1'b0;
		else if (x_cnt == H_sync_end)
			hsync_next = 1'b1;
			
		if (y_cnt == 11'd0)
			vsync_next <= 1'b0;
		else if(y_cnt == V_sync_end)
			vsync_next <= 1'b1;
    end

	assign pixel_x = x_cnt - H_Show_Start;
	assign pixel_y = y_cnt - V_Show_Start;

endmodule	
