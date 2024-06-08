# 项目名称
### 8_bits_cpu

# 设计思路
### 因为设计的是8位多周期CPU，所以选择部件分散连接的方式从而一定程度上降低每条指令所需的时钟周期。设计思路可以参考工程根目录下的8_bits_cpu.emmx(请使用MindMaster打开)。
# 工程文件
### 使用vivado创建和开发工程。其中设计文件位于.\8_bits_cpu.srcs\sources_1\new，仿真文件位于.\8_bits_cpu.srcs\sim_1\new。

# 指令集
## (一)指令集格式
<!--[image](image/pic1.png)-->
|短指令|ins_code |reg_addr |
|:-    |:-       |:-       |
|      |4'bXXXX  |4'bXXXX  |

|长指令|ins_code |reg_addr|rom/ram_addr/immediate|
|:-    |:-       |:-      |:-                    |
|      |4'bXXXX  |4'bXXXX |8'bXXXX_XXXXX         |
## (二)指令集内容
<!--[image](image/pic2.png)-->
|指令 / instruct         |助记符 / mnemonic |reg_addr     |rom/ram_addr/immediate|解释 / explain|
|:-                      |:-:              |:-:          |:-:                   |:-            |
|NOP                     |4'b0000          |4'b0000      |                      |空指令|
|HALT                    |4'b1000          |4'bXXXX      |                      |停止运行|
|B immediate             |4'b0001          |4'bXXXX      |8'bXXXX_XXXX          |无条件跳转至立即数所指向的地址|
|BEQ immediate           |4'b0010          |4'bXXXX      |8'bXXXX_XXXX          |当ac_out==reg_out时跳转至立即数所指向的地址|
|BLT immediate           |4'b0011          |4'bXXXX      |8'bXXXX_XXXX          |当ac_out<reg_out时时跳转至立即数所指向的地址|
|LDO rom[addr]           |4'b0101          |4'bXXXX      |8'bXXXX_XXXX          |将rom[addr]的值写入AC|
|LDA ram[addr]           |4'b0110          |4'bXXXX      |8'bXXXX_XXXX          |将ram[addr]的值写入AC|
|STO reg[addr], ram[addr]|4'b0111          |4'bXXXX      |8'bXXXX_XXXX          |将reg[addr]的值写入ram[addr]|
|PRE reg[addr]           |4'b1001          |4'bXXXX      |                      |将AC的值写入reg[addr]|
|LDM reg[addr]           |4'b1010          |4'bXXXX      |                      |将reg[addr]的值写入AC|
|ADDI immediate          |4'b1100          |4'bXXXX      |8'bXXXX_XXXX          |AC = AC + immediate|
|CPL                     |4'b1100          |4'bXXXX      |8'b0000_0000          |AC = ~AC|
|ADD reg[addr]           |4'b1101          |4'bXXXX      |                      |AC = AC + AC[addr]|
|LS reg[addr]            |4'b1110          |4'bXXXX      |                      |AC = AC << reg[addr]|
|RS reg[addr]            |4'b1111          |4'bXXXX      |                      |AC = AC >> reg[addr]|

# 寄存器组
|名称      |功能      |注意事项    |
|:-:       |:-:       |:-         |
|R00/R0    |通用寄存器 |无 / Empty |
|R01/R1    |通用寄存器 |无 / Empty |
|R02/R2    |通用寄存器 |无 / Empty |
|R03/R3    |通用寄存器 |无 / Empty |
|R04/R4    |通用寄存器 |无 / Empty |
|R05/R5    |通用寄存器 |无 / Empty |
|R06/R6    |通用寄存器 |无 / Empty |
|R07/R7    |通用寄存器 |无 / Empty |
|R08/R8    |通用寄存器 |无 / Empty |
|R09/R9    |通用寄存器 |无 / Empty |
|R10       |通用寄存器 |无 / Empty |
|R11       |通用寄存器 |无 / Empty |
|R12/TP    |临时寄存器 |用于实现大部分的软件指令，不建议在程序当作通用寄存器中使用 |
|R13/SP    |堆栈寄存器 |存储栈的地址，不建议在程序当作通用寄存器中使用 |
|R14/LR    |链接寄存器 |用于实现函数、中断返回，不建议在程序当作通用寄存器中使用 |
|R15/PC    |程序计数器 |程序计数器存储着下一条指令的地址，其值只能通过跳转指令修改 |
