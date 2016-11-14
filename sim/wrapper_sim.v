`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 10.11.2016 13:13:42
// Design Name:
// Module Name: wrapper_sim
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


module wrapper_sim(

    );

reg clk = 0;
wire data;

always begin
    #20 clk <= ~clk;
end

wrapper f1(.CLK_50MHZ(clk),
           .CLK_SMA(data)
          );

endmodule
