`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2021 11:41:51 AM
// Design Name: 
// Module Name: DFlipFlop
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


module DFlipFlop #(parameter WL = 32)
    (input CLK, RST,
    input [WL-1:0] D,
    output reg [WL-1:0] Q);
    
    always @(posedge CLK) begin
        if(RST)
            Q <= 0;
        else
            Q <= D;
    end
endmodule

module XFlipFlop #(parameter WL = 32)
    (input CLK, RST,
    input [WL-1:0] X,
    output reg [WL-1:0] Q);
    
    always @(posedge CLK) begin
        if(RST)
            Q <= 'b0000010011;
        else
            Q <= X;
    end
endmodule
