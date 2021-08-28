module anode_control(sel,dot,anode);

	input [1:0] sel;
	output reg [3:0]anode;
	output reg dot;
	
	always @(sel)
	begin
		//Lógica barrada
		case(sel)
			0: begin anode = 4'b0111; dot = 1'b1; end
			1: begin anode = 4'b1011; dot = 1'b0; end
			2: begin anode = 4'b1101; dot = 1'b1; end
			3: begin anode = 4'b1110; dot = 1'b1; end
			default: begin anode = 4'b1111; dot = 1'b1; end
		endcase	
	end
	
endmodule
