module SEG_D(clk,rst_n,data,dezena,unidade,lsb,lcd_sel);  
  
input clk;  
input rst_n;  
input [15:0]data;


//----Adicionados----//
reg [7:0] temperatura;
output reg [3:0] dezena;
output reg [3:0] unidade;
output reg [3:0] lsb;
output reg [1:0] lcd_sel;
// ------------- //
  
always@(clk)  
begin
   /* Adicionado */
	
	temperatura =  data[13]*32 + data[12]*16 + data[11]*8 + data[10]*4 + data[9]*2 + data[8]*1;
	
	//Conversão
	unidade = temperatura % 10;
	dezena = (temperatura/10) % 10;
	
	if(data[7] == 1)
		lsb = 5;
	else
		lsb = 0;
	
	//Verificando se está no intervalo Frio, Normal ou Quente
	
	if(temperatura < 32 || (temperatura == 32 && data[7] == 0))
		lcd_sel = 0; //Frio
	else if((temperatura == 32 && data[7] == 1) || (temperatura >= 32 && temperatura <= 34) || (temperatura == 35 && data[7] == 0))
		lcd_sel = 1; //Normal
	else if((temperatura == 35 && data[7] == 1) || temperatura >= 36)
		lcd_sel = 2; //Quente
		
	
	/*-----------*/
	
end
endmodule   