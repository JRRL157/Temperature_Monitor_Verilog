module bcd_control(display1,display2,display3,display4,sel,saida);

	input [3:0] display1;
	input [3:0] display2;
	input [3:0] display3;
	input [3:0] display4;

	input [1:0] sel;
	
	output reg [3:0] saida;
	
	always @(sel)
	begin
		case(sel)
			0: saida = display1;
			1: saida = display2;
			2: saida = display3;
			3: saida = display4;
		endcase
	end
	
endmodule
