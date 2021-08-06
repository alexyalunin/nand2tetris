
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

//SP--
@SP
M=M-1

@SP
A=M
D=M
@THAT
M=D

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
@THAT
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

//*SP=i
@1
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
@1
D=A
@THAT
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
@2
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
@15
M=D//RAM[15]=addr

//*addr=*SP
@SP
A=M
D=M//D=*SP
@15
A=M//A=addr
M=D//*addr=*SP

(MAIN_LOOP_START)

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
D=M
@COMPUTE_ELEMENT
D;JNE

@END_PROGRAM
0;JMP

(COMPUTE_ELEMENT)

//addr=ARG+i
@0
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

//addr=ARG+i
@1
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

//SP--
@SP
M=M-1

//addr=ARG+i
@2
D=A
@THAT
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

@THAT
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
D=M+D
M=D//stacknowpointstosum
@SP
M=M+1

//SP--
@SP
M=M-1

@SP
A=M
D=M
@THAT
M=D

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
@15
M=D//RAM[15]=addr

//*addr=*SP
@SP
A=M
D=M//D=*SP
@15
A=M//A=addr
M=D//*addr=*SP

@MAIN_LOOP_START
0;JMP

(END_PROGRAM)


