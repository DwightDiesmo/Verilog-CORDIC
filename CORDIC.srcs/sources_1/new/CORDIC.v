`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2021 12:07:53 PM
// Design Name: 
// Module Name: CORDIC
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

module CORDIC #(parameter WLI = 8, WLF = 8, WLI2 = 8, WLF2 = 8, WIO = 2, WFO = 8)
            (input CLK, RST,
             input [3:0] i,
             input signed [(WLI2+WLF2)-1:0] angle,
             output [(WIO+WFO)-1:0] sin, cos);
    
    localparam WII = 9;
    localparam WFI = 9;
    wire [(WLI+WLF)-1:0] Xin; //Cosine
    //wire [(WLI+WLF)-1:0] Xout;
    wire [(WLI+WLF)-1:0] Yin; //Sine
    //wire [(WLI+WLF)-1:0] Yout;
    wire [(WLI2+WLF2)-1:0] Zin; //Phi
    wire [(WLI2+WLF2)-1:0] Zout; //Phi
    wire [(WII+WFI)-1:0] gamma;
    wire signed [1:0] di;
    wire [(WLI+WLF)-1:0] sine, cosine;
      
    //assign Xin = {{(WLI){1'b0}}, {6'b100110, {(WLF-6){1'b0}}}};
    //assign Yin = 0;
    //assign Zin = 0;
    wire [WLI-1:0] sineI; 
    wire [WLF-1:0] sineF;
    wire [WIO-1:0] sinI; 
    wire [WFO-1:0] sinF;
    assign {sineI, sineF} = sine;
    
    assign sinI = (WIO>WLI) ? {{(WIO-WLI){sineI[WLI-1]}},sineI[WLI-1:0]} : (WIO==WLI) ? sineI[WLI-1:0] : (WIO<WLI) ? {sineI[WLI-1], sineI[WIO-2:0]} : sineI[WLI-1:0];
    assign sinF = (WFO>WLF) ? {sineF[WLF-1:0],{(WFO-WLF){1'b0}}} : (WFO==WLF) ? sineF[WLF-1:0] : (WFO<WLF) ? sineF[WLF-1:WLF-WFO] : sineF[WLF-1:0];
    assign sin = {sinI, sinF};

    
    wire [WLI-1:0] cosineI; 
    wire [WLF-1:0] cosineF;
    wire [WIO-1:0] cosI; 
    wire [WFO-1:0] cosF;
    assign {cosineI, cosineF} = cosine;
    
    assign cosI = (WIO>WLI) ? {{(WIO-WLI){cosineI[WLI-1]}},cosineI[WLI-1:0]} : (WIO==WLI) ? cosineI[WLI-1:0] : (WIO<WLI) ? {cosineI[WLI-1], cosineI[WIO-2:0]} : cosineI[WLI-1:0];
    assign cosF = (WFO>WLF) ? {cosineF[WLF-1:0],{(WFO-WLF){1'b0}}} : (WFO==WLF) ? cosineF[WLF-1:0] : (WFO<WLF) ? cosineF[WLF-1:WLF-WFO] : cosineF[WLF-1:0];
    assign cos = {cosI, cosF};
   
//   reg signed [(WLI2+WLF2)-1:0] angleAdjusted;
   
//   always@(*) begin
//       if(RST==1) begin
//           if((angle >= 0)&&(angle <=90)) begin
//            angleAdjusted = angle;
//           end else if ((angle>90) && (angle<=180)) begin
//            angleAdjusted = angle -90;
//           end else if ((angle >180)&&(angle<=270)) begin
//            angleAdjusted = angle -180;
//           end else if ((angle > 270)&&(angle <= 360)) begin
//            angleAdjusted = angle -270;
//           end
//       end
//   end
   
   
    
    LookUpTable #(.WII(WII), .WFI(WFI)) LUT (.iterationIndex(i), .gamma(gamma));
    DFlipFlop #(.WL(WLI2+WLF2)) ZFlipFlop (.CLK(CLK), .RST(RST), .D(Zin), .Q(Zout));
    DFlipFlop #(.WL(WLI+WLF)) YFlipFlop (.CLK(CLK), .RST(RST), .D(Yin), .Q(sine));
    XFlipFlop #(.WL(WLI+WLF)) XFF (.CLK(CLK), .RST(RST), .X(Xin), .Q(cosine));
    SetDI #(.WLI(WLI2), .WLF(WLF2)) DI (.in1(angle), .in2(Zout), .di(di));
    CalculateX #(.WLI(WLI), .WLF(WLF)) addSubX (.in1(cosine), .in2(sine), .di(di), .i(i), .out(Xin));
    CalculateY #(.WLI(WLI), .WLF(WLF)) addSubY (.in1(sine), .in2(cosine), .di(di), .i(i), .out(Yin));
    CalculateZ #(.WLI(WLI2), .WLF(WLF2)) addSubZ (.in1(Zout), .in2(gamma), .di(di), .i(i), .out(Zin));
    
    
    
endmodule


