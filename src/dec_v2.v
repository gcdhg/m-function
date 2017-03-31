module dec_v2 (
                clk,
                signal,
                data,
                data_origin,
                dataI,
                dataQ,
                buff_wr
                );

//parameter template = 31'b0110010011111011100010101101000; // for test and poduction
parameter template = 31'b0110101111000100110101111000100; // for test and poduction
//parameter template = 31'b1010000110010011111011100010101;
//parameter template = 31'b1010000110010011111011100010101;

input clk;
input [1:0] signal;

output [7:0] data;
output [7:0] data_origin;
output [7:0] dataI;
output [7:0] dataQ;
output [30:0] buff_wr;

reg [7:0] data_reg = 0;
reg [30:0] buff = 31'b0;

assign buff_wr = buff;
assign data_origin = ((~template[0] ^ buff[0]) ? 1 : (-1)) +
            ((~template[1] ^ buff[1]) ? 1 : (-1)) +
            ((~template[3] ^ buff[3]) ? 1 : (-1)) +
            ((~template[2] ^ buff[2]) ? 1 : (-1)) +
            ((~template[4] ^ buff[4]) ? 1 : (-1)) +
            ((~template[5] ^ buff[5]) ? 1 : (-1)) +
            ((~template[6] ^ buff[6]) ? 1 : (-1)) +
            ((~template[7] ^ buff[7]) ? 1 : (-1)) +
            ((~template[8] ^ buff[8]) ? 1 : (-1)) +
            ((~template[9] ^ buff[9]) ? 1 : (-1))+
            ((~template[10] ^ buff[10]) ? 1 : (-1)) +
            ((~template[11] ^ buff[11]) ? 1 : (-1)) +
            ((~template[12] ^ buff[12]) ? 1 : (-1)) +
            ((~template[13] ^ buff[13]) ? 1 : (-1)) +
            ((~template[14] ^ buff[14]) ? 1 : (-1)) +
            ((~template[15] ^ buff[15]) ? 1 : (-1)) +
            ((~template[16] ^ buff[16]) ? 1 : (-1)) +
            ((~template[17] ^ buff[17]) ? 1 : (-1)) +
            ((~template[18] ^ buff[18]) ? 1 : (-1)) +
            ((~template[19] ^ buff[19]) ? 1 : (-1)) +
            ((~template[20] ^ buff[20]) ? 1 : (-1)) +
            ((~template[21] ^ buff[21]) ? 1 : (-1)) +
            ((~template[22] ^ buff[22]) ? 1 : (-1)) +
            ((~template[23] ^ buff[23]) ? 1 : (-1)) +
            ((~template[24] ^ buff[24]) ? 1 : (-1)) +
            ((~template[25] ^ buff[25]) ? 1 : (-1)) +
            ((~template[26] ^ buff[26]) ? 1 : (-1)) +
            ((~template[27] ^ buff[27]) ? 1 : (-1)) +
            ((~template[28] ^ buff[28]) ? 1 : (-1)) +
            ((~template[29] ^ buff[29]) ? 1 : (-1)) +
            ((~template[30] ^ buff[30]) ? 1 : (-1)) +
            31;

assign dataI = ((~template[0] ^ buff[0]) ? 1 : (-1)) +
            ((~template[2] ^ buff[2]) ? 1 : (-1)) +
            ((~template[4] ^ buff[4]) ? 1 : (-1)) +
            ((~template[6] ^ buff[6]) ? 1 : (-1)) +
            ((~template[8] ^ buff[8]) ? 1 : (-1)) +
            ((~template[10] ^ buff[10]) ? 1 : (-1)) +
            ((~template[12] ^ buff[12]) ? 1 : (-1)) +
            ((~template[14] ^ buff[14]) ? 1 : (-1)) +
            ((~template[16] ^ buff[16]) ? 1 : (-1)) +
            ((~template[18] ^ buff[18]) ? 1 : (-1))+
            ((~template[20] ^ buff[20]) ? 1 : (-1)) +
            ((~template[22] ^ buff[22]) ? 1 : (-1)) +
            ((~template[24] ^ buff[24]) ? 1 : (-1)) +
            ((~template[26] ^ buff[26]) ? 1 : (-1)) +
            ((~template[28] ^ buff[28]) ? 1 : (-1)) +
            ((~template[30] ^ buff[30]) ? 1 : (-1)) +
            16;

assign dataQ = ((~template[1] ^ buff[1]) ? 1 : (-1)) +
            ((~template[3] ^ buff[3]) ? 1 : (-1)) +
            ((~template[5] ^ buff[5]) ? 1 : (-1)) +
            ((~template[7] ^ buff[7]) ? 1 : (-1)) +
            ((~template[9] ^ buff[9]) ? 1 : (-1)) +
            ((~template[11] ^ buff[11]) ? 1 : (-1)) +
            ((~template[13] ^ buff[13]) ? 1 : (-1)) +
            ((~template[15] ^ buff[15]) ? 1 : (-1)) +
            ((~template[17] ^ buff[17]) ? 1 : (-1)) +
            ((~template[19] ^ buff[19]) ? 1 : (-1)) +
            ((~template[21] ^ buff[21]) ? 1 : (-1)) +
            ((~template[23] ^ buff[23]) ? 1 : (-1)) +
            ((~template[25] ^ buff[25]) ? 1 : (-1)) +
            ((~template[27] ^ buff[27]) ? 1 : (-1)) +
            ((~template[29] ^ buff[29]) ? 1 : (-1)) +
            15;

assign data = dataI + dataQ;

always @ ( posedge clk ) begin
//    buff <= {buff[28:0], signal};
      buff <= {signal, buff[30:1]}; //test_def
end

endmodule // dec
