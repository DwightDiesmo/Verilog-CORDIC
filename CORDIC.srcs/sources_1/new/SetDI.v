`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2021 11:47:17 AM
// Design Name: 
// Module Name: SetDI
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


module SetDI #(parameter WLI = 8, WLF = 8)
    (input [(WLI+WLF)-1:0] in1, in2,
    output reg signed [1:0] di);
    
    always @(*) begin
        di = (in1 > in2) ? 1 : (in1 < in2) ? -1 : 0;
    end
endmodule
