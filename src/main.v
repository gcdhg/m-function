module main (CLK_50MHZ, out_fun, data);

parameter fase_param = 4'b0101;
parameter type_param = 4'b1101;

input CLK_50MHZ;

output out_fun;
output [7:0] data;

wire [3:0] fase_new;
wire control_wire,
     out;

reg [3:0] fase_reg = fase_param;
reg [5:0] cnt = 0;


mfun f1(.clk(CLK_50MHZ),
        .fase(fase_reg),
        .type_f(type_param),
        .fase_new(fase_new),
        .sum(out),
        .control(control_wire)
        );

dec f2(.clk(control_wire),
       .signal(out),
       .data(data)
       );

assign out_fun = out;

always @ (posedge CLK_50MHZ) begin
  if (control_wire) begin
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
