module dec (clk, signal, data, buff_wr);

//parameter template = 31'b1100010110001011000101100010110; // param for testing
parameter template = 31'b0110100011010001101000110100011; //param for main

input clk;
input signal;

output [7:0] data;
output [30:0] buff_wr;

reg [7:0] data_reg = 0;
reg [30:0] buff = 31'b0;

assign buff_wr = buff;
assign data = ((~template[0] ^ buff[0]) ? 31'b1 : (-31'b1)) +
            ((~template[1] ^ buff[1]) ? 31'b1 : (-31'b1)) +
            ((~template[3] ^ buff[3]) ? 31'b1 : (-31'b1)) +
	  	      ((~template[2] ^ buff[2]) ? 31'b1 : (-31'b1)) +
            ((~template[4] ^ buff[4]) ? 31'b1 : (-31'b1)) +
            ((~template[5] ^ buff[5]) ? 31'b1 : (-31'b1)) +
            ((~template[6] ^ buff[6]) ? 31'b1 : (-31'b1)) +
            ((~template[7] ^ buff[7]) ? 31'b1 : (-31'b1)) +
            ((~template[8] ^ buff[8]) ? 31'b1 : (-31'b1)) +
            ((~template[9] ^ buff[9]) ? 31'b1 : (-31'b1))+
            ((~template[10] ^ buff[10]) ? 31'b1 : (-31'b1)) +
            ((~template[11] ^ buff[11]) ? 31'b1 : (-31'b1)) +
            ((~template[12] ^ buff[12]) ? 31'b1 : (-31'b1)) +
            ((~template[13] ^ buff[13]) ? 31'b1 : (-31'b1)) +
            ((~template[14] ^ buff[14]) ? 31'b1 : (-31'b1)) +
            ((~template[15] ^ buff[15]) ? 31'b1 : (-31'b1)) +
            ((~template[16] ^ buff[16]) ? 31'b1 : (-31'b1)) +
            ((~template[17] ^ buff[17]) ? 31'b1 : (-31'b1)) +
            ((~template[18] ^ buff[18]) ? 31'b1 : (-31'b1)) +
            ((~template[19] ^ buff[19]) ? 31'b1 : (-31'b1)) +
            ((~template[20] ^ buff[20]) ? 31'b1 : (-31'b1)) +
            ((~template[21] ^ buff[21]) ? 31'b1 : (-31'b1)) +
            ((~template[22] ^ buff[22]) ? 31'b1 : (-31'b1)) +
            ((~template[23] ^ buff[23]) ? 31'b1 : (-31'b1)) +
            ((~template[24] ^ buff[24]) ? 31'b1 : (-31'b1)) +
            ((~template[25] ^ buff[25]) ? 31'b1 : (-31'b1)) +
            ((~template[26] ^ buff[26]) ? 31'b1 : (-31'b1)) +
            ((~template[27] ^ buff[27]) ? 31'b1 : (-31'b1)) +
            ((~template[28] ^ buff[28]) ? 31'b1 : (-31'b1)) +
            ((~template[29] ^ buff[29]) ? 31'b1 : (-31'b1)) +
            ((~template[30] ^ buff[30]) ? 31'b1 : (-31'b1)) +
            31;

always @ ( posedge clk ) begin
    buff <= {buff[29:0], signal};
end

endmodule // dec
