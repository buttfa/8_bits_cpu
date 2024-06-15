# 项目名称 / Project name
### 8_bits_cpu

# 设计思路 / Design ideas
### 因为设计的是8位多周期CPU，所以选择部件分散连接的方式从而一定程度上降低每条指令所需的时钟周期。设计思路可以参考工程根目录下的8_bits_cpu.emmx(请使用MindMaster打开)。<br> Due to the design of an 8-bit multi cycle CPU, a decentralized connection method was chosen to reduce the clock cycle required for each instruction to a certain extent. The design concept can refer to 8'bits_cpu. emmx in the root directory of the project (please use MindMaster to open it).

# 工程文件 / Project files
### 使用vivado创建和开发工程。其中设计文件位于.\8_bits_cpu.srcs\sources_1\new，仿真文件位于.\8_bits_cpu.srcs\sim_1\new。<br> Create and develop projects using Vivado. The design files are located at .\8'bits_cpu.srcs\sources_1\new, simulation file located at.\8'bits_cpu.srcs\sim_1\new.

# 关于仿真 / About Simulation
### 请直接修改rom.v文件中的数据并使用vivado仿真 <br> Please directly modify the data in the rom.v file and use Vivado simulation

# 指令集 / Instruction set
## (一)指令集格式 / Instruction set format
<!--[image](image/pic1.png)-->
|短指令 / short instruction|ins_code |reg_addr |
|:-                        |:-       |:-       |
|                          |4'bXXXX  |4'bXXXX  |

|长指令 / long intstruction|ins_code |reg_addr|immediate             |
|:-                        |:-       |:-      |:-                    |
|                          |4'bXXXX  |4'bXXXX |8'bXXXX_XXXXX         |
## (二)指令集内容 / Instruction set content
<!--[image](image/pic2.png)-->
|指令 / instruct         |助记符 / mnemonic |reg_addr     |immediate             |解释 / explain|
|:-                      |:-:              |:-:          |:-:                   |:-            |
|NOP                     |4'b0000          |4'b0000      |                      |空指令 / Empty instruction|
|HALT                    |4'b1000          |4'bXXXX      |                      |停止运行 / Stop running|
|B immediate             |4'b0001          |4'bXXXX      |8'bXXXX_XXXX          |无条件跳转至立即数所指向的地址 / Unconditionally jump to the address pointed to by the immediate value|
|BEQ immediate           |4'b0010          |4'bXXXX      |8'bXXXX_XXXX          |当ac_out==reg_out时跳转至立即数所指向的地址 / Jump to the address pointed to by the immediate value when ac_out==reg_out|
|BLT immediate           |4'b0011          |4'bXXXX      |8'bXXXX_XXXX          |当ac_out<reg_out时时跳转至立即数所指向的地址 / Jump to the address pointed to by the immediate value when ac_out<reg_out|
|LDO                     |4'b0101          |4'b1001      |                      |将rom[ROC]的值写入AC / Write the value of rom [addr] into AC|
|LDA                     |4'b0110          |4'b1010      |                      |将ram[RAC]的值写入AC / Write the value of ram [addr] into AC|
|STO reg[addr]           |4'b0111          |4'b1010      |                      |将AC的值写入ram[RAC] / Write the value of reg [addr] into ram [addr]|
|PRE reg[addr]           |4'b1001          |4'bXXXX      |                      |将reg[addr]的值写入AC / Write the value of Reg [addr] into AC|
|LDM reg[addr]           |4'b1010          |4'bXXXX      |                      |将AC的值写入reg[addr] / Write the value of AC into Reg [addr]|
|ADDI immediate          |4'b1100          |4'bXXXX      |8'bXXXX_XXXX          |AC = AC + immediate|
|CPL                     |4'b1100          |4'bXXXX      |8'b0000_0000          |AC = ~AC|
|ADD reg[addr]           |4'b1101          |4'bXXXX      |                      |AC = AC + reg[addr]|
|LS reg[addr]            |4'b1110          |4'bXXXX      |                      |AC = AC << reg[addr]|
|RS reg[addr]            |4'b1111          |4'bXXXX      |                      |AC = AC >> reg[addr]|

# 寄存器组
|名称 / Name |功能 / Function              |注意事项 / Notice|
|:-          |:-:                          |:-              |
|R00/R0      |通用寄存器 / General register |无 / Empty |
|R01/R1      |通用寄存器 / General register |无 / Empty |
|R02/R2      |通用寄存器 / General register |无 / Empty |
|R03/R3      |通用寄存器 / General register |无 / Empty |
|R04/R4      |通用寄存器 / General register |无 / Empty |
|R05/R5      |通用寄存器 / General register |无 / Empty |
|R06/R6      |通用寄存器 / General register |无 / Empty |
|R07/R7      |通用寄存器 / General register |无 / Empty |
|R08/R8      |通用寄存器 / General register |无 / Empty |
|R09/R9/ROC  |ROM计数器 / ROM counter       |ROM计数器存储着访问的ROM的地址 / The ROM counter stores the address of the accessed ROM |
|R10/RAC     |RAM计数器 / RAM counter       |RAM计数器存储着访问的RAM的地址 / The RAM counter stores the address of the accessed RAM |
|R11/TP1     |临时寄存器 / General register |用于实现大部分的软件指令，不建议在程序当作通用寄存器中使用 <br> Used to implement most software instructions, it is not recommended to use it as a general-purpose register in the program|
|R12/TP2     |临时寄存器 / General register |用于实现大部分的软件指令，不建议在程序当作通用寄存器中使用 <br> Used to implement most software instructions, it is not recommended to use it as a general-purpose register in the program|
|R13/SP      |堆栈寄存器 / Stack register   |存储栈的地址，不建议在程序当作通用寄存器中使用 <br> The address of the storage stack is not recommended for use in programs as general-purpose registers|
|R14/LR      |链接寄存器 / Link register    |用于实现函数、中断返回，不建议在程序当作通用寄存器中使用 <br> Used to implement functions and interrupt returns, not recommended for use in programs as general-purpose registers|
|R15/PC      |程序计数器 / Program counter  |程序计数器存储着下一条指令的地址，其值只能通过跳转指令修改 <br> The program counter stores the address of the next instruction, and its value can only be modified by a jump instruction|
