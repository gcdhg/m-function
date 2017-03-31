`timescale 1ns / 1ps

module qpsk_main_sim(
    
    );

/*
метод формирования когда одновременно генирируются 2 м последовательности и склеиваются в одну


ВНИМАНИЕ: ПОКА ЧТО НЕ РАБОЧИЙ
*/

reg clk = 0;
reg [4:0] cnt = 0;
reg [30:0] buff = 0;

always begin
    #5 clk <= ~clk;
end

wire [7:0] data;
wire [7:0] dataI;
wire [7:0] dataQ;
wire [7:0] data_origin;
wire signal;
wire [30:0] buff_wr;

reg [7:0] data_r = 0;

qpsk_main ff1(.CLK_50MHZ(clk),
         .out_fun(signal),
         .data(data),
         .dataI(dataI),
         .dataQ(dataQ),
         .data_origin(data_origin),
         .buff_wr(buff_wr)
        );

always @(posedge clk) begin
    buff <= {buff[29:0], signal};
    $display("------------------------");
    $display(" curent signal = %b \n data decoded = %d", signal, data);
    $display(" dataI decoded = %d", dataI);
    $display(" dataQ decoded = %d", dataQ);
    $display(" data_origin decoded = %d", data_origin);
    $display(" budd = %b", buff);
    if ((dataI > 30)||(dataQ > 30)) begin
            $display(" peak -------------------------------------------------------------------------------");
    end
end

endmodule
