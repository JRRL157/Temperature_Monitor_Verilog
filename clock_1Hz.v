module clock_1Hz(clk,clock);

	input clk;
	output reg clock;
	
	reg [25:0] cont;
	initial
	begin
		cont = 0;
	end
	
	always @(posedge clk)
	begin
		cont = cont + 1;
		if(cont == 25_000_000)
			begin
				clock = ~clock;
				cont = 0;
			end		
	end

endmodule
