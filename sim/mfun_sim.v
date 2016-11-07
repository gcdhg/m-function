`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 29.09.2016 13:46:24
// Design Name:
// Module Name: mfun_sim
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


module mfun_sim(
    );

reg clk = 0;

always begin
    #5 clk <= ~clk;
end

wire [3:0] fase_new;
wire sum;
wire control;
reg [3:0] fase = 4'b0101;
reg [4:0] cnt = 0;
reg [30:0] buff = 0;

mfun f1(.clk(clk), .fase(fase), .type_f(4'b0101), .fase_new(fase_new), .sum(sum), .control(control));

always @(posedge control) begin
    fase <= fase_new;
    cnt <= cnt + 1;
    buff <= {buff[29:0], sum};
    if (cnt == 31)begin
        $display ("%b", buff);
        $stop;
        cnt <= 0;
    end
end

endmodule
