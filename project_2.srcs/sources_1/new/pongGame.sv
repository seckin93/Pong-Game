`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/24/2016 05:04:47 PM
// Design Name: 
// Module Name: VGA
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

module pongGame( input  logic clk,
             //input logic ps2_clk, ps2_data,
             input logic[1:0] keys1, keys2,

             
             output logic[7:0] seg,
             output logic [3:0] an,

            output logic hsync, vsync,output logic [3:0] red, green, blue );
    
    logic [7:0] r, g, b;
    logic [9:0] x, y;
    logic dirX = 1'b1;
    logic dirY = 1'b1;

    logic [3:0] score1 = 4'b0;
    logic [3:0] score2 = 4'b0;

    logic[9:0] xCount = 10'd320;
    logic[9:0] yCount = 10'd240;
    logic[9:0] Paddle1, Paddle2;
    videoGen videoGen(x, y, Paddle1, Paddle2 ,xCount, yCount, r, g, b);
    logic vgaclk;
    clockDivider clock(clk, vgaclk);
    VGAController vgaCont(vgaclk, hsync, vsync, x, y);
    
    logic divclk;
    logic outclk;
    ClockDivider5000(clk, divclk);
    
    always_ff@(posedge divclk) begin
    
    if(keys1 == 2'b10)begin
        Paddle1 = Paddle1 + 2;
    end
    else if(keys1 == 2'b01)begin
            Paddle1 = Paddle1 - 2;
    end
    if(keys2 == 2'b10)begin
            Paddle2 = Paddle2 + 2;
    end
    else if(keys2 == 2'b01)begin
            Paddle2 = Paddle2 - 2;
    end
    
    
        if(Paddle1 > 10'b0101110111)begin
            Paddle1 <= 10'b0101110111;
        end
        else if(Paddle1 < 10'b0000000010)begin
            Paddle1 <= 10'b0000000011;
            end
            
        if(Paddle2 > 10'b0101110111)begin
                        Paddle2 <= 10'b0101110111;
                    end
                    else if(Paddle2 < 10'b0000000010)begin
                        Paddle2 <= 10'b0000000011;
                        end
        if(xCount <= 10'd10 && (Paddle1 <= yCount && Paddle1 + 100>= yCount))begin
            dirX <= 1'b1;
            end
        if(xCount >= 10'd630 && (Paddle2 <= yCount && Paddle2 + 100>= yCount))begin
            dirX <= 1'b0;
        end    
        if(yCount == 10'b0000000000) begin           
        dirY <= 1'b0;
        end
        if(yCount == 10'b0111100000)begin
        dirY <= 1'b1;
         end
         
        if(xCount < 10'd8)begin
        xCount <= 10'd360;
        yCount <= 10'd240;
        score2 <= score2 + 1;
        end
        else if (xCount > 10'd635)begin
        xCount <= 10'd360;
        yCount <= 10'd240;
        score1 <= score1 + 1;
        end
        else begin
        yCount <= (dirY ? yCount - 1: yCount + 1);
        xCount <= (dirX ? xCount + 1 : xCount - 1);
        end
        
        
        
        
    end
    
    
    
    SevSeg_4digit segment(clk, score1, in1, in2, score2, seg[0],seg[1],seg[2],seg[3],seg[4],seg[5],seg[6],seg[7], an);    
    assign red   = {r[7],r[5],r[3],r[1]};
    assign green = {g[7],g[5],g[3],g[1]};
    assign blue  = {b[7],b[5],b[3],b[1]};
    /*
    always_comb begin
        red[3] = r[7];
        red[2] = r[5];
        red[1] = r[3];
        red[0] = r[1];
        blue[3] = b[7];
        blue[2] = b[5];
        blue[1] = b[3];
        blue[0] = b[1];
        green[3] = g[7];
        green[2] = g[5];
        green[1] = g[3];
        green[0] = g[1];
    end
    */

endmodule
