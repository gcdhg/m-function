`timescale 1ns / 1ps
module dec_qpsk_sim ();

parameter template = 31'b0110010011111011100010101101000;

reg clk = 0;
reg signal = 0;

always begin
  #10 clk <= ~clk;
end

wire [7:0] dataI;
wire [7:0] dataQ;
wire [7:0] data_origin;
wire [30:0] buff_wr;

reg flag = 0;
reg [4:0] cnt = 0;
reg [4:0] cnt2 = 0;
reg [30:0] template_copy = template;

dec_qpsk f1(.clk(clk),
            .signal(signal),
            .dataI(dataI),
            .dataQ(dataQ),
            .data_origin(data_origin),
            .buff_wr(buff_wr)
            );

always @(posedge clk) begin
    signal <= template_copy[0];
    template_copy <= {template_copy[29:0], template_copy[30]};
end

always @(posedge clk) begin
    cnt2 <= cnt2 + 1;
    $display("--------------------");
    if (buff_wr == template) begin
        cnt2 <= 0;
        $display("true peak");
    end
    $display(" data = %d \n buff = %b \n cnt = %d", data_origin, buff_wr, cnt2);
end

endmodule // dec_sim