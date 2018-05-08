`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/26/2016 07:43:29 AM
// Design Name: 
// Module Name: videoGen
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

module videoGen(input logic[9:0] x, y, top1, top2, xCount, yCount,
                 output logic[7:0] r, g, b);

    logic inrect;
    logic paddlee1, paddlee2;


    Ball ball(x , y, xCount, yCount, xCount + 5, yCount + 5, inrect);
    assign r = 8'hFF;
    assign b = 8'h00;
    Paddle paddle1(x, y, top1, 0,paddlee1);
    Paddle paddle2(x,y, top2, 630, paddlee2);

    assign g = (inrect || paddlee1 || paddlee2) ? 8'hFF: 8'h00;
   
    
endmodule

