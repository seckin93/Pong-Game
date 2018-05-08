`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/24/2016 06:06:11 PM
// Design Name: 
// Module Name: clockDivider
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
module clockDivider(input  logic clk,
                    output logic newClock );

    int counter = 0;
    int max = 4;

    always@(posedge clk) begin
        if (counter == max) begin
            newClock <= 1'b1; //newClock is now 1, on the rising edge
            counter  <= 0;
        end
        else begin
            counter  <= counter+1;
            newClock <= 0;
        end
    end

endmodule
