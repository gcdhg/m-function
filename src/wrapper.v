`timescale 1ns / 1ps
module wrapper(
    input CLK_50MHZ,
    output CLK_SMA
    );

wire [7:0] data;

main ff1(.CLK_50MHZ(CLK_50MHZ),
         .data(data)
         );

assign CLK_SMA = (data > 61) ? 1'b1 : 1'b0;

endmodule
