module segments_controller(clk,d1,d2,d3,catodo,anodo,ponto,teste);

	input clk;
	input [3:0] d1,d2,d3;
	output reg [6:0] catodo;
	output reg ponto;
	output reg [3:0] anodo;
	output reg teste;
	
	wire clock_lento;
	
	refresh_clock_10kHz ref_clock (clk,clock_lento);
	
	always @(posedge clock_lento)
	begin
		teste = ~teste;
	end
	
	
	
endmodule
