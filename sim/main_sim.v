`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.09.2016 14:03:34
// Design Name: 
// Module Name: signal_control_sim
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


module main_sim(
    );

reg clk = 0;

always begin
    #5 clk <= ~clk;
end    

wire clk_w;

main f1(.CLK_50MHZ(clk), .out_fun(clk_w));

always @(clk_w) begin
    $display("current signal");
    $display(clk_w);
end

endmodule
