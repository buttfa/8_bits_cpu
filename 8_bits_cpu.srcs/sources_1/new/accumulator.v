`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/12 10:56:59
// Design Name: 
// Module Name: accumulator
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


module accumulator(
        input rst, // 复位信号 / Reset signal
        input ac_en, // AC的使能信号 / Enabling signal of AC
        input ac_source, // AC输入来源选择，0表示数据来自REGS，1表示数据来自ALU / AC input source selection, 0 represents data from REGS, 1 represents data from ALU
        input [7:0] reg_out, // 来自REGS的数据 / Data from REGS
        input [7:0] alu_out, // 来自ALU的数据 / Data from ALU
    
        output reg [7:0] ac_out // AC输出 / AC output
    );


    parameter 
        REG = 1'b0,
        ALU = 1'b1;

    always @(negedge rst or posedge ac_en) begin
        if (!rst) begin
            ac_out <= 8'b0000_0000;
        end else if (ac_en) begin
            case (ac_source)
                REG: begin
                    ac_out <= reg_out;
                end 
                ALU: begin
                    ac_out <= alu_out;
                end
                default: begin
                    ac_out <= ac_out;
                end
            endcase
        end
    end

endmodule
