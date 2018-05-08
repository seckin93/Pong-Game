`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/24/2016 09:37:43 PM
// Design Name: 
// Module Name: ClockDivider5000
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


module ClockDivider5000(
    input logic clk,
    output logic outClk
    );
    
    localparam D= 500000;
    logic [18:0]counter;
    
    always@(posedge clk) begin
    if(counter <= D) counter <= counter+1;
    else counter <= 0;
    end
    
    always_comb begin
    if(counter == D ) outClk = 1;
    else outClk = 0;
    end
    
    
endmodule
