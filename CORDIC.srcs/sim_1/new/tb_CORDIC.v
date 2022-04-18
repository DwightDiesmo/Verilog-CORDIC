`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2021 12:24:38 PM
// Design Name: 
// Module Name: tb_CORDIC
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
module tb_CORDIC();
    parameter WLI = 5, WLF = 5, WLI2 = 9, WLF2 = 9; 
    parameter WIO = 2, WFO = 8; 
    reg CLK, RST;
    reg [3:0] i;
    reg signed [(WLI2+WLF2)-1:0] angle;
    wire [(WLI+WLF)-1:0] sin, cos;
    integer s,c;
    
    CORDIC #(.WLI(WLI),.WLF(WLF),.WLI2(WLI2),.WLF2(WLF2),.WIO(WIO),.WFO(WFO)) UUT (.CLK(CLK), .RST(RST), .i(i), .angle(angle), .sin(sin), .cos(cos));
    
    initial begin
        CLK = 0;
        s = $fopen("outputsine.txt");
        c = $fopen("outputcosine.txt");
    end
    
    always begin
        #5 CLK = ~CLK;
    end
    
    initial begin
        RST = 1; angle = {9'd30, 9'd0};
    #10 RST = 0; i = 0; //$fwrite(s, "%b\n", sin); $fwrite(c, "%b\n", cos);
    #10 i = 1; $fwrite(s, "%b\n", sin); $fwrite(c, "%b\n", cos);
    #10 i = 2; $fwrite(s, "%b\n", sin); $fwrite(c, "%b\n", cos);
    #10 i = 3; $fwrite(s, "%b\n", sin); $fwrite(c, "%b\n", cos); 
    #10 i = 4; $fwrite(s, "%b\n", sin); $fwrite(c, "%b\n", cos);
    #10 i = 5; $fwrite(s, "%b\n", sin); $fwrite(c, "%b\n", cos);
    #10 i = 6; $fwrite(s, "%b\n", sin); $fwrite(c, "%b\n", cos);
    #10 i = 7; $fwrite(s, "%b\n", sin); $fwrite(c, "%b\n", cos);
    #10 i = 8; $fwrite(s, "%b\n", sin); $fwrite(c, "%b\n", cos);
    #10 i = 9; $fwrite(s, "%b\n", sin); $fwrite(c, "%b\n", cos); 
    #10 $fwrite(s, "%b\n", sin); $fwrite(c, "%b\n", cos); $fclose(s); $fclose(c); $finish;
    end
endmodule

