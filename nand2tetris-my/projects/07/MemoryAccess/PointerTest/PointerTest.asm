
//*SP=i
@3030
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++

//SP--
@SP
M=M-1

@SP
A=M
D=M
@THIS
M=D

//*SP=i
@3040
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++

//SP--
@SP
M=M-1

@SP
A=M
D=M
@THAT
M=D

//*SP=i
@32
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
@2
D=A
@THIS
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

//*SP=i
@46
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
@6
D=A
@THAT
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

@THIS
D=M

@SP
A=M
M=D

@SP
M=M+1//SP++

@THAT
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
@2
D=A
@THIS
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

//addr=ARG+i
@6
D=A
@THAT
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
