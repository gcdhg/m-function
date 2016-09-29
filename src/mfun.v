module mfun (clk, fase, type_f, fase_new, sum, control);

parameter delay = 20;

input clk;
input [3:0] fase;
input [3:0] type_f;
output reg [3:0] fase_new;
output sum;
output control;

reg [4:0] cnt = 0;
reg control_reg = 1'b0;
reg sum_reg;

assign sum = sum_reg;
assign control = control_reg;

always @ ( posedge clk ) begin
  if (cnt == delay) begin
    cnt <= 0;
    fase_new <= {sum_reg , fase[3:1]};
    control_reg <= 1'b1;
  end 
  else begin
    cnt <= cnt + 1;
    control_reg <= 1'b0;  
    sum_reg <= fase[0] ^ type_f[0] + fase[1] ^ type_f[1] + fase[2] ^ type_f[2] + fase[3] ^ type_f[3];
  end
end

endmodule // mfun
