module contador(clk,d1,d2,d3);
	
	input clk;
	output reg [3:0] d1;
	output reg [3:0] d2;
	output reg [3:0] d3;
	
	reg [7:0] cont;
	reg [7:0] aux;
	
	always @(posedge clk)
	begin		
		if(cont <= 255)
			cont = cont + 1;
		else
			cont = 0;		
		
		aux = cont;
		//Convertendo
		d3 = aux % 10;
		aux = aux / 10;
		d2 = aux % 10;
		aux = aux / 10;
		d1 = aux;		
	end
	
endmodule
