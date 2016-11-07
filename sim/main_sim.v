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
reg [4:0] cnt = 0;
reg [30:0] buff;
always begin
    #5 clk <= ~clk;
end

wire [7:0] data;
wire clk_w;

main f1(.CLK_50MHZ(clk),
        .out_fun(clk_w),
        .data(data)
        );

always @(clk_w) begin
    buff <= {buff[29:0], clk_w};
    cnt <= cnt + 1;
    if (cnt == 31) begin
        $display(buff);
        $stop;
    end
    $display("current signal");
    $display(clk_w);
end

endmodule
