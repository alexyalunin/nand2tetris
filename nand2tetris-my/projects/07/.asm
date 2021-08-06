
//*SP=i
@0
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++

//SP--
@SP
M=M-1

//addr=ARG+i
@0
D=A
@LCL
D=D+M
@R13
M=D//RAM[13]=addr

//*addr=*SP
@SP
A=M
D=M//D=*SP
@R13
A=M//A=addr
M=D//*addr=*SP
(LOOP_START)
//addr=ARG+i
@0
D=A
@ARG
D=D+M

//*SP=*addr
A=D
D=M

@SP
A=M
M=D

@SP
M=M+1//SP++

//addr=ARG+i
@0
D=A
@LCL
D=D+M

//*SP=*addr
A=D
D=M

@SP
A=M
M=D

@SP
M=M+1//SP++

@SP
M=M-1
A=M
D=M//D=y
@SP
M=M-1
A=M//M=x
D=M+D
M=D//stacknowpointstosum
@SP
M=M+1

//SP--
@SP
M=M-1

//addr=ARG+i
@0
D=A
@LCL
D=D+M
@R13
M=D//RAM[13]=addr

//*addr=*SP
@SP
A=M
D=M//D=*SP
@R13
A=M//A=addr
M=D//*addr=*SP

//addr=ARG+i
@0
D=A
@ARG
D=D+M

//*SP=*addr
A=D
D=M

@SP
A=M
M=D

@SP
M=M+1//SP++

//*SP=i
@1
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++

@SP
M=M-1
A=M
D=M//D=y
@SP
M=M-1
A=M//M=x
D=M-D
M=D//stacknowpointstosum
@SP
M=M+1

//SP--
@SP
M=M-1

//addr=ARG+i
@0
D=A
@ARG
D=D+M
@R13
M=D//RAM[13]=addr

//*addr=*SP
@SP
A=M
D=M//D=*SP
@R13
A=M//A=addr
M=D//*addr=*SP

//addr=ARG+i
@0
D=A
@ARG
D=D+M

//*SP=*addr
A=D
D=M

@SP
A=M
M=D

@SP
M=M+1//SP++

@SP
A=M
D=M
@LOOP_START
D;JMP

//addr=ARG+i
@0
D=A
@LCL
D=D+M

//*SP=*addr
A=D
D=M

@SP
A=M
M=D

@SP
M=M+1//SP++
