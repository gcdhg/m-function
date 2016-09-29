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


module signal_control_sim(
    );

reg cl = 0,
    clk = 0;

always begin
    #5 cl <= ~cl;
    #50 clk <= ~clk;
end    

wire clk_w;

signal_control f1 (.clk(cl), .signal(clk), .control(clk_w));

endmodule
