module lm75 (clk,rst_n,scl,sda,cs,seg);
input clk,rst_n; 
output scl;  
inout sda;   
output[3:0] cs;  
output[7:0] seg;  
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
.cs(cs),
.seg(seg),
.data(data)
         );
endmodule