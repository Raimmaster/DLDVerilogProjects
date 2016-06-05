`timescale 1ns / 1ps
module VGA(
    input CLK_25MH,
    //input [2:0] RGBin,
    output reg [2:0] RGB,
    output reg hsync,
    output reg vsync
	 //output [9:0] hcounter,
	 //output [9:0] vcounter
);
	
	
    reg [9:0] hcount;
    reg [9:0] vcount;

	    
   
	always @ ( posedge CLK_25MH)
    begin
        if (hcount == 799) begin
            hcount = 0;
            if (vcount == 524) begin
                vcount = 0;
				end
            else begin
                vcount = vcount + 1;
            end
			end
        else begin
            hcount = hcount + 1;
        end

        if (vcount >= 490 && vcount < 492) begin
            vsync = 0;
        end
        else begin
            vsync = 1;
        end

        if (hcount >= 656 && hcount < 752) begin
            hsync = 0;
        end
        else begin
            hsync = 1;
        end

        if (hcount < 640 && vcount < 480) begin
            if(hcount < 80) begin
					RGB = 3'b000;
				end
				else if (hcount < 160) begin
					RGB = 3'b001;
				end
				else if (hcount < 240) begin
					RGB = 3'b010;
				end
				else if (hcount < 320) begin
					RGB = 3'b011;
				end
				else if (hcount < 400) begin
					RGB = 3'b100;
				end
				else if (hcount < 480) begin
					RGB = 3'b101;
				end
				else if (hcount < 560) begin
					RGB = 3'b110;
				end
				else begin
					RGB = 3'b111;
				end
        end
        else begin
            RGB = 3'b000;
        end
    end
	 
	 //initial
	 //begin
		//hcount =0;
		//vcount=0;
	 //end

endmodule