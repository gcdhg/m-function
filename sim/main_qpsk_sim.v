`timescale 1ns / 1ps
module main_qpsk_sim(
    );

reg clk = 0;
reg [4:0] cnt = 0;
reg [30:0] buff = 0;

always begin
    #5 clk <= ~clk;
end

wire [7:0] dataI;
wire [7:0] dataQ;
wire [7:0] data_origin;
wire signal;
wire [30:0] buff_wr;

reg [7:0] data_r = 0;

main_qpsk ff1(.CLK_50MHZ(clk),
         .out_fun(signal),
         .dataI(dataI),
         .dataQ(dataQ),
         .data_origin(data_origin),
         .buff_wr(buff_wr)
        );

always @(posedge clk) begin
    buff <= {buff[29:0], signal};
    $display("%d", data_origin);
end

endmodule
