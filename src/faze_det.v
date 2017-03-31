`timescale 1ns / 1ps
module faze_det(
    dataI,
    dataQ,
    f_state
    );

input [7:0] dataI;
input [7:0] dataQ;
output reg [1:0] f_state;

always
    if (dataI >= 30) begin
        f_state[0] <= 1;
    end
    else
        f_state[0] <= 0;
endmodule
