`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:33:13 05/31/2016 
// Design Name: 
// Module Name:    Main 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Main(
		input clk50mhz,
		output [2:0] RGB,
		output hsync,
		output vsync
    );

	wire vga_clk;
	wire [2:0] rgb;
	wire hs;
	wire vs;
	// synthesis attribute CLKFX_DIVIDE of vga_clock_dcm is 4
	// synthesis attribute CLKFX_MULTIPLY of vga_clock_dcm is 2
	DCM vga_clock_dcm (.CLKIN(clk50mhz),.CLKFX(vga_clk));
	
	VGA vga(vga_clk, rgb, hs, vs);
	
	assign RGB = rgb;
	assign hsync = hs;
	assign vsync = vs;
endmodule
