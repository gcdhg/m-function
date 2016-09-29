module main (CLK_50MHZ, out_fun);

parameter fase_param = 4'b0101;
parameter type_param = 4'b1101;

input CLK_50MHZ;
output out_fun;

wire control_wire,
//     TRANSMITION_START,
     out;

reg [3:0] fase_reg = fase_param;
wire [3:0] fase_new;
reg out_reg;
reg [4:0] cnt;
//signal_control f1(.signal(control_wire),
//                  .control(TRANSMITION_START)
//                  );

mfun f2(.clk(CLK_50MHZ),
        .fase(fase_reg),
        .type_f(type_param),
        .fase_new(fase_new),
        .sum(out),
        .control(control_wire)
        );

assign out_fun = out_reg;

always @ (posedge CLK_50MHZ) begin
  if (control_wire) begin
      if (cnt != 32) begin
        cnt <= cnt + 1;
        fase_reg <= fase_new;
        out_reg <= out;
      end
      else begin
        cnt <= 0;
        fase_reg <= fase_param;
      end
  end
end

endmodule // main
