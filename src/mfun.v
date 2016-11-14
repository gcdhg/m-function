module mfun (clk, fase, type_f, fase_new, sum);

parameter delay = 2;
parameter count = 4;

input clk;
input [4:0] fase;
input [4:0] type_f;
output [4:0] fase_new;
output sum;

assign sum = (fase[0] & type_f[0]) ^ (fase[1] & type_f[1]) ^ (fase[2] & type_f[2]) ^ (fase[3] & type_f[3]) ^ (fase[4] & type_f[4]);
assign fase_new = {sum , fase[4:1]};

endmodule // mfun
