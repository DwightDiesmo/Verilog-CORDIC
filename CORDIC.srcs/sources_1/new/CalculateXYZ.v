`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2021 11:58:45 AM
// Design Name: 
// Module Name: CalculateXYZ
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
module CalculateX #(parameter WLI = 8, WLF = 8)
    (input [(WLI+WLF)-1:0] in1, in2,
    input signed [1:0] di,
    input [3:0] i,
    output reg [(WLI+WLF)-1:0] out);
    
    always @(*) begin
        out = (di == 1) ? in1 - (in2>>i) : (di == -1) ? in1 + (in2>>i) : 0;
    end
endmodule

module CalculateY #(parameter WLI = 8, WLF = 8)
    (input [(WLI+WLF)-1:0] in1, in2,
    input signed [1:0] di,
    input [3:0] i,
    output reg [(WLI+WLF)-1:0] out);
    
    always @(*) begin
        out = (di == 1) ? in1 + (in2>>i) : (di == -1) ? in1 - (in2>>i) : 0;
    end
endmodule

module CalculateZ #(parameter WLI = 8, WLF = 8)
    (input [(WLI+WLF)-1:0] in1, in2,
    input signed [1:0] di,
    input [3:0] i,
    output reg [(WLI+WLF)-1:0] out);
    
    always @(*) begin
        out = (di == 1) ? in1 + in2 : (di == -1) ? in1 - in2 : 0;
    end
endmodule