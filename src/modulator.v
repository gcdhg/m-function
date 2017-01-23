module modulator (clk,
                  signal,
                  sinwt,
                  coswt
                  );

input clk;
input signal;
output reg sinwt;
output reg coswt;

reg cnt = 0;

always @ ( posedge clk ) begin
  cnt <= ~cnt;
  if (~cnt) begin
    sinwt <= signal;
  end
  else begin
    coswt <= signal;
  end
end

endmodule // modulator
