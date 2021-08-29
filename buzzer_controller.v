module buzzer_controller(estado,clk,sinal);
	
	input [1:0] estado;
	input clk;
	output reg sinal;
	
	reg [25:0] cont;
	reg [25:0] cont2;
	reg flag;
	reg aciona;
	
	initial
	begin
		cont = 0;
		cont2 = 0;
		flag = 1;
		aciona = 0;
	end
	
	always @(posedge clk)
	begin
		if(estado == 0) //Frio
		begin
			
			if(cont < 50_000_000)
			begin
				cont = cont + 1;
				aciona = 0;
			end
			else if(cont <= 55_000_000)
			begin
				aciona = 1;
				cont = cont + 1;
			end
			else
				cont = 0;
									
			if(aciona == 1)
			begin
				cont2 = cont2 + 1;
				
				if(cont2 == 5_000_00)
				begin
					sinal = ~sinal;
					cont2 = 0;
				end
			end
		end
		else if(estado == 2) //Quente
		begin
			if(cont < 12_500_000)
			begin
				cont = cont + 1;
				aciona = 0;
			end
			else if(cont <= 17_500_000)
			begin
				aciona = 1;
				cont = cont + 1;
			end
			else
				cont = 0;
			
			if(aciona == 1)
			begin
				cont2 = cont2 + 1;
				
				if(cont2 == 5_000)
				begin
					sinal = ~sinal;
					cont2 = 0;
				end
			end
		end
		else
		begin
			sinal = 0;
			cont = 0;
			cont2 = 0;
		end
	end
	
endmodule
