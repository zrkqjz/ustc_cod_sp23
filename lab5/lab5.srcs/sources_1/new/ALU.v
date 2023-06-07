`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/26 19:54:55
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [32-1:0] a,b,
    input [3:0] func,
    output reg [32-1:0] y,
    output reg of
    );
    
    always @ (*) begin
        if(func == 4'b0000) begin
            y = $signed(a) + $signed(b);
            if(a[32-1] == 1 && b[32-1] == 1) of = (y[32-1] == 1)?0:1;
            else if (a[32-1] == 0 && b[32-1] == 0) of = (y[32-1] == 0)?0:1;
            else of = 0;
        end
        else if(func == 4'b0001) begin
            y = $signed(a) - $signed(b);
            if(a[32-1] == 0 && b[32-1] == 1) of = (y[32-1] == 1)?1:0;
            else if (a[32-1] == 1 && b[32-1] == 0) of = (y[32-1] == 0)?1:0;
            else of = 0;
        end
        else if(func == 4'b0010) begin
            y[0] = (a == b)?1:0;
            y[32-1:1] = 0;
            of = 0;
        end
        else if(func == 4'b0011) begin
            y[0] = (a < b)?1:0;
            y[32-1:1] = 0;
            of = 0;
        end
        else if(func == 4'b0100) begin
            y[0] = ($signed(a) < $signed(b))?1:0;
            y[32-1:1] = 0;
            of = 0;
        end
        else if(func == 4'b0101) begin
            y = a & b;
            of = 0;
        end
        else if(func == 4'b0110) begin
            y = a | b;
            of = 0;
        end
        else if(func == 4'b0111) begin
            y = a ^ b;
            of = 0;
        end
        else if(func == 4'b1000) begin
            y = a >> b;
            of = 0;
        end
        else if(func == 4'b1001) begin
            y = a << b;
            of = 0;
        end
        else begin
            y = 0;
            of = 0;
        end
    end
endmodule
