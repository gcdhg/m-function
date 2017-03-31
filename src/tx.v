`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.02.2017 16:33:10
// Design Name: 
// Module Name: tx
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tx(
    input CLK,
    input FCLK,
    input [31:0] DATA_IN,
    output signed [11:0] DATA_I,
    output signed [11:0] DATA_Q,
    output signed [11:0] DATA,
    
	input DAC_DCO_P,
    input DAC_DCO_N,
    output [11:0] DAC_P,
    output [11:0] DAC_N,
    output DAC_DCI_P,
    output DAC_DCI_N
        
    );
    
    reg [31:0] test_pattern1 = 32'b11010010110100101101001011010010;
    reg [31:0] test_pattern2 = 32'b00111001110001100011100111000110;
    reg [31:0] m_seq =         32'b10110101000111011111001001100000;
    
    wire w_i,w_q, tclk;
    serial s1 (
        .CLK(CLK),
        .RST(),
        .FIFO_EMPTY(1'b0),
        .FIFO_RD_CLK(),
        .DATA_IN(DATA_IN),
        .DOUT_I(w_i),
        .DOUT_Q(w_q),
        .CLK_OUT(tclk)
        );
    
    wire signed [11:0] fpk_I, fpk_Q;
    
    fn2 filter1(
        .din_i(w_i),
        .din_q(w_q),
        .clk(FCLK),        // clk 160MHz
        .dclk(tclk),        // data clk 5MHz
        .dout_i(fpk_I),
        .dout_q(fpk_Q)
        );
        
    wire signed [11:0] dds_sin, dds_cos;
    
    dds dds_5M ( .CLK(FCLK),
         .strobe(),
         .init_phase(5'b0),
        //    input [15:0] add_phase,
         .phase(),
         .SIN(dds_sin),
         .COS(dds_cos)
        );
        
       wire signed [23:0] mul_I, mul_Q; 
        
       MULT_MACRO #(
           .DEVICE("7SERIES"), // Target Device: "7SERIES" 
           .LATENCY(3),        // Desired clock cycle latency, 0-4
           .WIDTH_A(12),       // Multiplier A-input bus width, 1-25
           .WIDTH_B(12)        // Multiplier B-input bus width, 1-18
        ) MULT_MACRO_I (
           .P(mul_I),     // Multiplier output bus, width determined by WIDTH_P parameter 
           .A(dds_sin),     // Multiplier input A bus, width determined by WIDTH_A parameter 
           .B(fpk_I),     // Multiplier input B bus, width determined by WIDTH_B parameter 
           .CE(1'b1),   // 1-bit active high input clock enable
           .CLK(FCLK), // 1-bit positive edge clock input
           .RST()  // 1-bit input active high reset
        );
             
           MULT_MACRO #(
            .DEVICE("7SERIES"), // Target Device: "7SERIES" 
            .LATENCY(3),        // Desired clock cycle latency, 0-4
            .WIDTH_A(12),       // Multiplier A-input bus width, 1-25
            .WIDTH_B(12)        // Multiplier B-input bus width, 1-18
         ) MULT_MACRO_Q (
            .P(mul_Q),     // Multiplier output bus, width determined by WIDTH_P parameter 
            .A(dds_cos),     // Multiplier input A bus, width determined by WIDTH_A parameter 
            .B(fpk_Q),     // Multiplier input B bus, width determined by WIDTH_B parameter 
            .CE(1'b1),   // 1-bit active high input clock enable
            .CLK(FCLK), // 1-bit positive edge clock input
            .RST()  // 1-bit input active high reset
         );
       
        assign DATA_I = mul_I[23:12];
        assign DATA_Q = mul_Q[23:12];  
        
 
        reg signed [14:0] DATA_r;
        
        always @(posedge FCLK)
            DATA_r <= DATA_I + DATA_Q;
            
        assign DATA = DATA_r[12:1];
   
   	AD9780 #(.MASK(12'b100010010110)) dac (
            .PD(PD_INT),
    
            .DAC_DCO_P(DAC_DCO_P),
            .DAC_DCO_N(DAC_DCO_N),
            .DAC_DCI_P(DAC_DCI_P),
            .DAC_DCI_N(DAC_DCI_N),
            .DAC_P(DAC_P),
            .DAC_N(DAC_N),
    
            .CLK(dac_dco),
            .DATA_A(DATA_I),
            .DATA_B(DATA_Q)
        );
   
   
   
    
    
endmodule
