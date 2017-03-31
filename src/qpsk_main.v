module qpsk_main (CLK_50MHZ,
             out_fun,
             data,
             dataI,
             dataQ,
             data_origin,
             buff_wr
             );

parameter fase_paramI = 5'b10101;
parameter fase_paramQ = 5'b10101;
parameter type_paramI = 5'b10101;
parameter type_paramQ = 5'b10101;

input CLK_50MHZ;

output out_fun;
output [7:0] data;
output [7:0] dataI;
output [7:0] dataQ;
output [7:0] data_origin;
output [30:0] buff_wr;

wire [4:0] fase_newI;
wire [4:0] fase_newQ;
wire [1:0] signal;

reg [4:0] fase_regI = fase_paramI;
reg [4:0] fase_regQ = fase_paramQ;
reg [5:0] cnt = 0;
reg control = 0;

mfun f1(.fase(fase_regI),
        .type_f(type_paramI),
        .fase_new(fase_newI),
        .sum(signal[1])
        );

mfun f2(.fase(fase_regQ),
        .type_f(type_paramQ),
        .fase_new(fase_newQ),
        .sum(signal[0])
        );

dec_v2 f3(.clk(CLK_50MHZ),
            .signal(signal),
            .data(data),
            .dataI(dataI),
            .dataQ(dataQ),
            .data_origin(data_origin),
            .buff_wr(buff_wr)
            );

assign out_fun = signal;

always @ (posedge CLK_50MHZ) begin
    fase_regI <= fase_newI;
    fase_regQ <= fase_newQ;
end

endmodule
