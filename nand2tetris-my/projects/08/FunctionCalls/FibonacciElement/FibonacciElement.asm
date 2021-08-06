
@256
D=A
@0
M=D

@LABEL1
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++

@R1
D=M

@SP
A=M
M=D

@SP
M=M+1//SP++

@R2
D=M

@SP
A=M
M=D

@SP
M=M+1//SP++

@R3
D=M

@SP
A=M
M=D

@SP
M=M+1//SP++

@R4
D=M

@SP
A=M
M=D

@SP
M=M+1//SP++

@SP
D=M
@5
D=D-A
@ARG
M=D

@SP
D=M
@LCL
M=D

@Sys.init
0;JMP
(LABEL1)


(Main.fibonacci)

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
@LABEL2
D;JLT
@SP
A=M
M=0
@LABEL3
0;JMP
(LABEL2)
@SP
A=M
M=-1
(LABEL3)
@SP
M=M+1

@SP
M=M-1
A=M
D=M
@IF_TRUE
D;JNE

@IF_FALSE
0;JMP

(IF_TRUE)

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

(IF_FALSE)

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

@LABEL4
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++

@R1
D=M

@SP
A=M
M=D

@SP
M=M+1//SP++

@R2
D=M

@SP
A=M
M=D

@SP
M=M+1//SP++

@R3
D=M

@SP
A=M
M=D

@SP
M=M+1//SP++

@R4
D=M

@SP
A=M
M=D

@SP
M=M+1//SP++

@SP
D=M
@6
D=D-A
@ARG
M=D

@SP
D=M
@LCL
M=D

@Main.fibonacci
0;JMP
(LABEL4)
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

@LABEL5
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++

@R1
D=M

@SP
A=M
M=D

@SP
M=M+1//SP++

@R2
D=M

@SP
A=M
M=D

@SP
M=M+1//SP++

@R3
D=M

@SP
A=M
M=D

@SP
M=M+1//SP++

@R4
D=M

@SP
A=M
M=D

@SP
M=M+1//SP++

@SP
D=M
@6
D=D-A
@ARG
M=D

@SP
D=M
@LCL
M=D

@Main.fibonacci
0;JMP
(LABEL5)
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



(Sys.init)

//*SP=i
@4
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++

@LABEL6
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++

@R1
D=M

@SP
A=M
M=D

@SP
M=M+1//SP++

@R2
D=M

@SP
A=M
M=D

@SP
M=M+1//SP++

@R3
D=M

@SP
A=M
M=D

@SP
M=M+1//SP++

@R4
D=M

@SP
A=M
M=D

@SP
M=M+1//SP++

@SP
D=M
@6
D=D-A
@ARG
M=D

@SP
D=M
@LCL
M=D

@Main.fibonacci
0;JMP
(LABEL6)
(WHILE)

@WHILE
0;JMP


