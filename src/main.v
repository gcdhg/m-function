module main (CLK_50MHZ, out_fun, data, buff_wr, sclk);

parameter fase_param = 5'b10101;
parameter type_param = 5'b11101;

input CLK_50MHZ;

output out_fun;
output [7:0] data;
output [30:0] buff_wr;
output sclk;

wire [4:0] fase_new;
wire out;

reg [4:0] fase_reg = fase_param;
reg [5:0] cnt = 0;

mfun f1(.clk(CLK_50MHZ),
        .fase(fase_reg),
        .type_f(type_param),
        .fase_new(fase_new),
        .sum(out)
        );

dec f2(.clk(CLK_50MHZ),
       .signal(out),
       .data(data),
       .buff_wr(buff_wr)
       );

assign out_fun = out;
assign sclk = CLK_50MHZ;

always @ (posedge CLK_50MHZ) begin
  if (CLK_50MHZ) begin
      if (cnt != 32) begin
        cnt <= cnt + 1;
        fase_reg <= fase_new;
      end
      else begin
        cnt <= 0;
        fase_reg <= fase_param;
      end
  end
end

endmodule // main
