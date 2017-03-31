`timescale 1ns / 1ps
module mfun_sim(
    );

reg clk = 0;

always begin
    #5 clk <= ~clk;
end

wire [4:0] fase_new;
wire sum;
reg [4:0] fase = 4'b10101; // 0101
reg [4:0] cnt = 0;
reg [30:0] buff = 0;

mfun f1(.fase(fase), .type_f(5'b11101), .fase_new(fase_new), .sum(sum));
//mfun (clk, fase, type_f, fase_new, sum);

always @(posedge clk) begin
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
