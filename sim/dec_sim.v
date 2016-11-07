`timescale 1ns / 1ps
module dec_sim ();

parameter template = 31'b0110100110100110100101001101001;

reg clk = 0;
reg signal = 0;

always begin
  #5 clk <= ~clk;
end

wire [7:0] data;
wire [30:0] buff_wr;
reg [7:0] cnt=0;

dec f1(.clk(clk), /*.template(template),*/ .signal(signal), .data(data), .buff_wr(buff_wr));

always @(posedge clk) begin
    cnt <= cnt + 1;
    if (cnt == 31) begin
        cnt<= 0;
        signal <= 0;
    end
    else signal <= template[cnt];
    if (buff_wr == template) $stop;
end

endmodule // dec_sim
