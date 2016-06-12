`timescale 1ns / 1ps
module Main(
	input clk_audio,
	input do_nota,
	input re_nota,
	input mi_nota,
	input sol_nota,
	
	output [3:0] tono
    );
/*
	C	2986 BAA
	D	2660 A64
	E	2369 941
	G	1993 7C9
	
	Dividir entre 2 para cambiar de posedge y negedge
*/
	wire clk_out_do;
	wire clk_out_re;
	wire clk_out_mi;
	wire clk_out_sol;
	//do
	clk_divider #(.limit(12'hBAA)) clk_do (
			.clk(clk_audio),
			.clk_d(clk_out_do)
	);
	
	//re
	clk_divider #(.limit(12'hA64)) clk_re (
			.clk(clk_audio),
			.clk_d(clk_out_re)
	);
	
	//mi
	clk_divider #(.limit(12'h941)) clk_mi (
			.clk(clk_audio),
			.clk_d(clk_out_mi)
	);
	
	//sol
	clk_divider #(.limit(12'h7C9)) clk_sol (
			.clk(clk_audio),
			.clk_d(clk_out_sol)
	);
	
	
	wire clk_actual;
	reg [4:0] address;
	reg temp;
	assign clk_actual = temp;
	
	sinewave_rom_do rom_tono(address, tono);


	always @(posedge clk_actual) 
	begin
		address = address + 1;
	end	
	
	always @(do_nota or re_nota or mi_nota or sol_nota)
	begin
		case(1)
			do_nota:
			begin
				temp = clk_out_do;
			end
			re_nota:
			begin
				temp = clk_out_re;
			end
			mi_nota:
			begin			
				temp = clk_out_mi;
			end
			sol_nota:
			begin
				temp = clk_out_sol;
			end
			default:
				begin
					temp = 0;
				end
		endcase
	end
	
endmodule
