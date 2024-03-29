`timescale 1ns / 1ps
module main_sim(
    );

reg clk = 0;
reg [4:0] cnt = 0;
reg [30:0] buff = 0;

always begin
    #5 clk <= ~clk;
end

wire [7:0] data;
wire signal;
wire [30:0] buff_wr;

reg [7:0] data_r = 0;

main ff1(.CLK_50MHZ(clk),
         .out_fun(signal),
         .data(data),
         .buff_wr(buff_wr)
        );

always @(posedge clk) begin
    buff <= {buff[29:0], signal};
    $display("------------------------");
    $display(" curent signal = %b \n data decoded = %d \n buff = %b", signal, data, buff);
end

endmodule
