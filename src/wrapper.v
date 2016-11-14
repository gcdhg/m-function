`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 10.11.2016 13:09:09
// Design Name:
// Module Name: wrapper
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


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
