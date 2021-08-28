module bcd_7seg(bin,dot,display,ponto);

	input [3:0]bin;
	input dot;
	output reg[6:0] display;
	output reg ponto;

	always @(bin)
	begin
		case(bin)
			0: display = 7'b1111110;
			1: display = 7'b0110000;
			2: display = 7'b1101101;
			3: display = 7'b1111001;
			4: display = 7'b0110011;
			5: display = 7'b1011011;
			6: display = 7'b1011111;
			7: display = 7'b1110000;
			8: display = 7'b1111111;
			9: display = 7'b1111011;
		endcase
		
		ponto = dot;
	end

endmodule
