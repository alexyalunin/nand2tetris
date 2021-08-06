
@256
D=A
@0
M=D

//callSys.init0

//pushreturnaddress
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

//functionClass1.set0
(Class1.set)
//pushargument0
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
//popstatic0
//SP--
@SP
M=M-1

@SP
A=M
D=M
@Class1.0
M=D
//pushargument1
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
//popstatic1
//SP--
@SP
M=M-1

@SP
A=M
D=M
@Class1.1
M=D
//pushconstant0
//*SP=i
@0
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++
//return
@LCL
D=M
@R13
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
@R15
M=D//RAM[15]=addr

//*addr=*SP
@SP
A=M
D=M//D=*SP
@R15
A=M//A=addr
M=D//*addr=*SP

@ARG
D=M+1
@SP
M=D

@R13
MD=M-1
A=D
D=M
@THAT
M=D

@R13
MD=M-1
A=D
D=M
@THIS
M=D

@R13
MD=M-1
A=D
D=M
@ARG
M=D

@R13
MD=M-1
A=D
D=M
@LCL
M=D

@R14
A=M
0;JMP
//functionClass1.get0
(Class1.get)
//pushstatic0
@Class1.0
D=M

@SP
A=M
M=D

@SP
M=M+1//SP++
//pushstatic1
@Class1.1
D=M

@SP
A=M
M=D

@SP
M=M+1//SP++
//sub
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
@R13
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
@R15
M=D//RAM[15]=addr

//*addr=*SP
@SP
A=M
D=M//D=*SP
@R15
A=M//A=addr
M=D//*addr=*SP

@ARG
D=M+1
@SP
M=D

@R13
MD=M-1
A=D
D=M
@THAT
M=D

@R13
MD=M-1
A=D
D=M
@THIS
M=D

@R13
MD=M-1
A=D
D=M
@ARG
M=D

@R13
MD=M-1
A=D
D=M
@LCL
M=D

@R14
A=M
0;JMP


//functionSys.init0
(Sys.init)
//pushconstant6
//*SP=i
@6
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++
//pushconstant8
//*SP=i
@8
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++
//callClass1.set2
//pushreturnaddress
@LABEL2
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
@7
D=D-A
@ARG
M=D

@SP
D=M
@LCL
M=D

@Class1.set
0;JMP
(LABEL2)//poptemp0
//SP--
@SP
M=M-1

@0
D=A
@5
D=D+A
@R15
M=D
@SP
A=M
D=M
@R15
A=M
M=D
//pushconstant23
//*SP=i
@23
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++
//pushconstant15
//*SP=i
@15
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++
//callClass2.set2
//pushreturnaddress
@LABEL3
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
@7
D=D-A
@ARG
M=D

@SP
D=M
@LCL
M=D

@Class2.set
0;JMP
(LABEL3)//poptemp0
//SP--
@SP
M=M-1

@0
D=A
@5
D=D+A
@R15
M=D
@SP
A=M
D=M
@R15
A=M
M=D
//callClass1.get0
//pushreturnaddress
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
@5
D=D-A
@ARG
M=D

@SP
D=M
@LCL
M=D

@Class1.get
0;JMP
(LABEL4)//callClass2.get0
//pushreturnaddress
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
@5
D=D-A
@ARG
M=D

@SP
D=M
@LCL
M=D

@Class2.get
0;JMP
(LABEL5)//labelWHILE
(WHILE)
//gotoWHILE
@WHILE
0;JMP


//functionClass2.set0
(Class2.set)
//pushargument0
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
//popstatic0
//SP--
@SP
M=M-1

@SP
A=M
D=M
@Class2.0
M=D
//pushargument1
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
//popstatic1
//SP--
@SP
M=M-1

@SP
A=M
D=M
@Class2.1
M=D
//pushconstant0
//*SP=i
@0
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++
//return
@LCL
D=M
@R13
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
@R15
M=D//RAM[15]=addr

//*addr=*SP
@SP
A=M
D=M//D=*SP
@R15
A=M//A=addr
M=D//*addr=*SP

@ARG
D=M+1
@SP
M=D

@R13
MD=M-1
A=D
D=M
@THAT
M=D

@R13
MD=M-1
A=D
D=M
@THIS
M=D

@R13
MD=M-1
A=D
D=M
@ARG
M=D

@R13
MD=M-1
A=D
D=M
@LCL
M=D

@R14
A=M
0;JMP
//functionClass2.get0
(Class2.get)
//pushstatic0
@Class2.0
D=M

@SP
A=M
M=D

@SP
M=M+1//SP++
//pushstatic1
@Class2.1
D=M

@SP
A=M
M=D

@SP
M=M+1//SP++
//sub
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
@R13
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
@R15
M=D//RAM[15]=addr

//*addr=*SP
@SP
A=M
D=M//D=*SP
@R15
A=M//A=addr
M=D//*addr=*SP

@ARG
D=M+1
@SP
M=D

@R13
MD=M-1
A=D
D=M
@THAT
M=D

@R13
MD=M-1
A=D
D=M
@THIS
M=D

@R13
MD=M-1
A=D
D=M
@ARG
M=D

@R13
MD=M-1
A=D
D=M
@LCL
M=D

@R14
A=M
0;JMP


