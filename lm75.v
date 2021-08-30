module lm75 (clk,rst_n,scl,sda,d1,d2,d3,visor_lcd);
input clk,rst_n; 
output scl;  
inout sda;
//-----------ADICIONADOS---------
output[3:0] d1;
output[3:0] d2;
output[3:0] d3;
output[1:0] visor_lcd;
//--------------------------------
wire done;    
wire[15:0] data;
I2C_READ I2C_READ(
        .clk(clk),
 .rst_n(rst_n),
 .scl(scl),
 .sda(sda),
 .data(data)
              );
SEG_D  SEG_D(
       .clk(clk),
.rst_n(rst_n),
.data(data),
.dezena(d1),
.unidade(d2),
.lsb(d3),
.lcd_sel(visor_lcd)
         );
endmodule
