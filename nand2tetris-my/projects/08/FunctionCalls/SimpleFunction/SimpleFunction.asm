
(SimpleFunction.test)

//*SP=i
@0
D=A

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

//addr=ARG+i
@1
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

@SP
M=M-1
A=M
M=!M
@SP
M=M+1

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

//addr=ARG+i
@1
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

//return
@LCL
D=M
@13
M=D

@5
A=D-A
D=M
@R14
M=D

//SP--
@SP
M=M-1

//addr=ARG+i
@0
D=A
@ARG
D=D+M
@15
M=D//RAM[15]=addr

//*addr=*SP
@SP
A=M
D=M//D=*SP
@15
A=M//A=addr
M=D//*addr=*SP

@ARG
D=M+1
@SP
M=D

@13
MD=M-1
A=D
D=M
@THAT
M=D

@13
MD=M-1
A=D
D=M
@THIS
M=D

@13
MD=M-1
A=D
D=M
@ARG
M=D

@13
MD=M-1
A=D
D=M
@LCL
M=D

@14
A=M
0;JMP


