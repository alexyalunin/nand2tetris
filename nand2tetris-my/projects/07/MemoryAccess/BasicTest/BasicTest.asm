
//*SP=i
@10
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

//*SP=i
@21
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++

//*SP=i
@22
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

//SP--
@SP
M=M-1

//addr=ARG+i
@1
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

//*SP=i
@36
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
@42
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++

//*SP=i
@45
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
@5
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

//SP--
@SP
M=M-1

//addr=ARG+i
@2
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

//*SP=i
@510
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++

//SP--
@SP
M=M-1

@6
D=A
@5
D=D+A
@R13
M=D
@SP
A=M
D=M
@R13
A=M
M=D

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
@5
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

//addr=ARG+i
@6
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

//addr=ARG+i
@6
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
D=M+D
M=D//stacknowpointstosum
@SP
M=M+1

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

@6
D=A
@5
A=D+A
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
