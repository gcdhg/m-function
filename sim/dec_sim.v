`timescale 1ns / 1ps
module dec_sim ();

parameter template = 31'b1100010110001011000101100010110;

reg clk = 0;
reg signal = 0;

always begin
  #5 clk <= ~clk;
end

wire [7:0] data;
wire [30:0] buff_wr;
reg [4:0] cnt = 30;

dec f1(.clk(clk), /*.template(template),*/ .signal(signal), .data(data), .buff_wr(buff_wr));

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
    $display("--------------------");
    if (data == 62) $display ("peak");
    if (buff_wr == template) $display("true peak");
    $display("data = %d \n buff = %b", data, buff_wr);
end

endmodule // dec_sim
