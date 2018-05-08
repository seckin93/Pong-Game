`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/26/2016 07:44:24 AM
// Design Name: 
// Module Name: Paddle
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


module Paddle(  input logic[9:0] x, y,
                 int top, left,
                 output logic inrect);
    assign inrect = (x >= left && x < left + 10 && y >= top && y < top + 100);
endmodule
