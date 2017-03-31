`timescale 1ns / 1ps
module wrapper_sim(

    );

reg clk = 0;
wire data;

always begin
    #5 clk <= ~clk;
end

always begin
    #20 clk <= ~clk;
end

wrapper f1(.CLK_50MHZ(clk),
           .CLK_SMA(data)
          );

endmodule
