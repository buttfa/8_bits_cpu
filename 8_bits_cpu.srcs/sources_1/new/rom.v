`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/10 08:56:54
// Design Name: 
// Module Name: rom
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

// ROM只读 / ROM Read Only
module rom(
        input rom_en, // rom使能信号 / ROM enable signal
        input [7:0] addr, // 读取数据的目标地址 / Target address for reading data
        input [7:0] pc_addr, // PC指向的指令地址 / The instruction address pointed to by the PC

        output reg [7:0] rom_out, // 输出的数据 / Output data
        output reg [7:0] instruct // 依据pc_addr取出的指令 / Instructions retrieved based on pc-addr
    );

    // 8x256=2048(bits)=256(bytes)
    reg  [7:0] rom [255:0];

    initial begin
        rom[0]  = 8'b0000_0000; // NOP
        
        // rom[1]  = 8'b0101_1001; // LDO
        // rom[2]  = 8'b0000_0000;
        // rom[3]  = 8'b0000_0000;
        
        // rom[1]  = 8'b0110_1010; // LDA
        // rom[2]  = 8'b0000_0000;
        // rom[3]  = 8'b0000_0000;
        
        // rom[1]  = 8'b1100_0000;
        // rom[2]  = 8'b0000_0000;
        // rom[3]  = 8'b0111_1010; // STO	

        // rom[1]  = 8'b1001_0010; // PRE
        // rom[2]  = 8'b0000_0000;
        // rom[3]  = 8'b0000_0000;

        // rom[1]  = 8'b1100_0000;
        // rom[2]  = 8'b0000_0000;
        // rom[3]  = 8'b1010_0000; // LDM

        // rom[1]  = 8'b1101_0010; // ADD
        // rom[2]  = 8'b0000_0000;
        // rom[3]  = 8'b0000_0000;

        // rom[1]  = 8'b1110_0010; // LS
        // rom[2]  = 8'b0000_0000;
        // rom[3]  = 8'b0000_0000;
        
        // rom[1]  = 8'b1111_0000; // RS
        // rom[2]  = 8'b0000_0000;
        // rom[3]  = 8'b0000_0000;

        // rom[1]  = 8'b0001_0000;	// B
        // rom[2]  = 8'b0000_0000;
        // rom[3]  = 8'b0000_0000;

        // rom[1]  = 8'b0010_0001; // BEQ
        // rom[2]  = 8'b0000_0000;
        // rom[3]  = 8'b0000_0000;

        // rom[1]  = 8'b0011_0010; // BLT
        // rom[2]  = 8'b0000_0000;
        // rom[3]  = 8'b0000_0000;

        rom[4]  = 8'b1000_0000;
    end 

    // 使能信号的上升沿更新输出数据 / Enable the rising edge of the signal to update the output data
    always @(posedge rom_en) begin
        rom_out <= rom[addr];
        instruct <= rom[pc_addr];
    end
endmodule
