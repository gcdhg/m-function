`timescale 1ns / 1ps
module dec_sim ();

parameter template = 31'b1010000110010011111011100010101;
//                         1110010110101011000101100110110
//                         1100010110001011000101100010110
reg clk = 0;
reg signal = 0;

always begin
  #10 clk <= ~clk;
end

wire [7:0] data;
wire [30:0] buff_wr;
reg [4:0] cnt = 30;
reg [4:0] cnt2 = 0;

dec f1(.clk(clk),
       .signal(signal),
       .data(data),
       .buff_wr(buff_wr)
       );

always @(negedge clk) begin
    if (cnt == 0) begin
        cnt <= 30;
        signal <= 0;
    end
    else begin
        cnt <= cnt - 1;
        signal <= template[cnt];
    end
end

always @(posedge clk) begin
    cnt2 <= cnt2 + 1;
    $display("--------------------");
    if (data == 62) $display ("peak");
    if (buff_wr == template) $display("true peak");
    $display(" data = %d \n buff = %b \n cnt = %d", data, buff_wr, cnt2);
end

endmodule // dec_sim
