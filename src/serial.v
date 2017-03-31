`timescale 1ns / 1ps

module serial(
    input CLK,
    input RST,
   
    input FIFO_EMPTY,
    output reg FIFO_RD_CLK,
    
    input [31:0] DATA_IN,
    output reg DOUT_I,
    output reg DOUT_Q,
    output reg CLK_OUT
    );
    
    initial 
        begin
            FIFO_RD_CLK <= 1'b0;
            DOUT_I <= 1'b0;
            DOUT_Q <= 1'b0;
        end
    
    
    parameter IDLE = 5'b00001;
    parameter WAIT = 5'b00010;
    parameter LOAD = 5'b00100;
    parameter SET  = 5'b01000;
    parameter SEND = 5'b10000;
    
    
    reg [4:0] state = IDLE;
    
    reg [3:0] cnt = 4'b00;
    reg [9:0] word_cnt = 10'b00;
        
    reg fifo_data_rdy;
    reg [31:0] data;
    
    
    always @(posedge CLK)
        if (RST)
            begin
                cnt <= 4'b00;
                word_cnt <= 10'b00;
                state <= IDLE;
                data <= 31'b00;
            end
            
        else 
        begin
            fifo_data_rdy <= !FIFO_EMPTY;
            case (state)
                IDLE:
                    begin
                        cnt <= 4'b00;
                        CLK_OUT <= 1'b0;
                        if (fifo_data_rdy) 
                            begin
                                state <= LOAD;
                                FIFO_RD_CLK <= 1'b1;
                                
                            end
                        else state <= IDLE; 
                    end
            
                LOAD:
                    begin
                        data <= {DATA_IN};
                        FIFO_RD_CLK <= 1'b0;
                        state <= SET;
                    end
                SET:
                    begin
                        CLK_OUT <= 1'b0;
                        FIFO_RD_CLK <= 1'b0; 
                        if ((cnt == 4'd15)&&(fifo_data_rdy)) data  <= DATA_IN;
                        else data <= data<<2;
                        DOUT_I <= data[31];
                        DOUT_Q <= data[30];
                        
                        state <= SEND;
                 
                    end
                    
                SEND:
                    begin   
                        CLK_OUT <= 1'b1;
                        if (cnt == 4'd15)
                            if (~fifo_data_rdy) state <= IDLE;
                            else 
                                begin
                                    FIFO_RD_CLK <= 1'b1;   
                                    state <= SET;
                                end
                        else state <= SET;
                        cnt <= cnt + 4'b01; 
                    end 
                    
            endcase
            end
                
endmodule
