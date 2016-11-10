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
wire signal;
wire [30:0] buff_wr;
wire contrl;
reg [7:0] data_r = 0;

main f1(.CLK_50MHZ(clk),
        .out_fun(signal),
        .data(data),
        .buff_wr(buff_wr),
        .sclk(contrl)
        );

always @(posedge contrl) begin
    buff <= {buff[29:0], signal};
    $display("------------------------");
    $display(" curent signal = %b \n data decoded = %d \n buff = %b", signal, data, buff);
end

endmodule
