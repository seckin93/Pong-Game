module cibik(  input logic[9:0] x, y,
                 int top, left,
                 output logic inrect);
    assign inrect = (x >= left && x < left + 10 && y >= top && y < top + 100);
endmodule