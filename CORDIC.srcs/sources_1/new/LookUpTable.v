`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2021 10:59:16 AM
// Design Name: 
// Module Name: LookUpTable
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


module LookUpTable #(parameter WII = 8, WFI = 8)
    (input [3:0] iterationIndex,
    output reg [(WII+WFI)-1:0] gamma);
    
    reg [WII-1:0] gammaI;
    reg [WFI-1:0] gammaF;
    
    always@(*) begin
        case(iterationIndex)
            0: begin
                gammaI = 'd45;
                gammaF = 'd0; 
            end
            1: begin
                gammaI = 'd26;
                gammaF = 'b100110011; 
            end
            2: begin
                gammaI = 'd14;
                gammaF = 'd0; 
            end
            3: begin
                gammaI = 'd7;
                gammaF = 'b00100000; 
            end 
            4: begin 
                gammaI = 'd3;
                gammaF = 'b10010011; 
            end 
            5: begin 
                gammaI = 'd1;
                gammaF = 'b11001010; 
            end 
            6: begin 
                gammaI = 'd0;
                gammaF = 'b11100101; 
            end 
            7: begin
                gammaI = 'd0;
                gammaF = 'b01110010; 
            end 
            8: begin
                gammaI = 'd0;
                gammaF = 'b00111001; 
            end 
            9: begin
                gammaI = 'd0;
                gammaF = 'b00011100; 
            end
        endcase
        gamma = {gammaI, gammaF};
    end
    
endmodule
