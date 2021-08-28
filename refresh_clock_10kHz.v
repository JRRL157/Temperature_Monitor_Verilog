module refresh_clock_10kHz(clk,clock);

	input clk;
	output reg clock;
	
	reg [11:0] cont;
	initial
	begin
		cont = 0;
	end
	
	always @(posedge clk)
	begin
		cont = cont + 1;
		if(cont == 2500)
			begin
				clock = ~clock;
				cont = 0;
			end
		
	end

endmodule
