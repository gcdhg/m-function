module main_qpsk (CLK_50MHZ,
             out_fun,
             dataI,
             dataQ,
             data_origin,
             buff_wr
             );



parameter fase_param = 5'b10101;
parameter type_param = 5'b11101;

input CLK_50MHZ;

output out_fun;
output [7:0] dataI;
output [7:0] dataQ;
output [7:0] data_origin;
output [30:0] buff_wr;

wire [4:0] fase_new;
wire signal;

reg [4:0] fase_reg = fase_param;
reg [5:0] cnt = 0;
reg control = 0;

mfun f1(.fase(fase_reg),
        .type_f(type_param),
        .fase_new(fase_new),
        .sum(signal)
        );

dec_qpsk f2(.clk(CLK_50MHZ),
            .signal(signal),
            .dataI(dataI),
            .dataQ(dataQ),
            .data_origin(data_origin),
            .buff_wr(buff_wr)
            );

assign out_fun = signal;

always @ (posedge CLK_50MHZ) begin
    fase_reg <= fase_new;
end

endmodule
