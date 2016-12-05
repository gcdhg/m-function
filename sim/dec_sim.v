`timescale 1ns / 1ps
module dec_sim ();

//parameter template = 31'b1010100011101111100100110000101;
parameter template = 31'b0011001001111101110001010110100; // test data
//parameter template = 31'b0010110101000111011111001001100;
reg clk = 0;
reg signal = 0;

always begin
  #10 clk <= ~clk;
end

wire [7:0] data;
wire [30:0] buff_wr;
reg [4:0] cnt = 0;
reg [4:0] cnt2 = 0;
reg flag = 0;
reg [30:0] template_copy = template;

dec f1(.clk(clk),
       .signal(signal),
       .data(data),
       .buff_wr(buff_wr)
       );

always @(posedge clk) begin
    signal <= template_copy[0];
    template_copy <= {template_copy[0], template_copy[30:1]};
//    case(cnt)
//        5'd30: begin
//            cnt <= 0;
//            signal <= template[cnt];
//        end
//        default: begin
//            signal <= template[cnt];
//            cnt <= cnt + 1;
//        end
//    endcase
//    if (cnt == 31) begin
//        cnt <= 1;
//        signal <= template[0];
//    end
//    else begin
//        cnt <= cnt + 1;
//        signal <= template[cnt];
//    end
end

always @(posedge clk) begin
    cnt2 <= cnt2 + 1;
    $display("--------------------");
    if (data == 62) $display ("peak");
    if (buff_wr == template) begin
        cnt2 <= 0;
        $display("true peak");
    end
    $display(" data = %d \n buff = %b \n cnt = %d", data, buff_wr, cnt2);
end

endmodule // dec_sim
