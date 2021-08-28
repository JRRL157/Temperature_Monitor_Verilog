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
		if(flag == 0) //Frio
		begin
			cont = cont + 1;
			if(cont == 50_000_000)
			begin
				aciona = ~aciona;
				cont = 0;
			end
			
			if(aciona == 1)
			begin
				cont2 = cont2 + 1;
				
				if(cont2 == 5_000_000)
				begin
					sinal = ~sinal;
					cont2 = 0;
				end
			end
		end
		else if(flag == 2) //Quente
		begin
			cont = cont + 1;
			if(cont == 12_500_000)
			begin
				aciona = ~aciona;
				cont = 0;
			end
			
			if(aciona == 1)
			begin
				cont2 = cont2 + 1;
				
				if(cont2 == 5_000_000)
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
		end
	end
		
	always @(estado)
	begin
		case(estado)
			0: flag = 0;
			1: flag = 1;
			2: flag = 2;
		endcase		
	end
	
endmodule
