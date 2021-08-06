
@256
D=A
@0
M=D

//callSys.init0

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

//functionSys.init0
(Sys.init)
//pushconstant4000
//*SP=i
@4000
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++
//poppointer0
//SP--
@SP
M=M-1

@SP
A=M
D=M
@THIS
M=D
//pushconstant5000
//*SP=i
@5000
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++
//poppointer1
//SP--
@SP
M=M-1

@SP
A=M
D=M
@THAT
M=D
//callSys.main0
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
@5
D=D-A
@ARG
M=D

@SP
D=M
@LCL
M=D

@Sys.main
0;JMP
(LABEL2)//poptemp1
//SP--
@SP
M=M-1

@1
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
//labelLOOP
(LOOP)
//gotoLOOP
@LOOP
0;JMP
//functionSys.main5
(Sys.main)

//*SP=i
@0
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++

//*SP=i
@0
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++

//*SP=i
@0
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++

//*SP=i
@0
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++

//*SP=i
@0
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++
//pushconstant4001
//*SP=i
@4001
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++
//poppointer0
//SP--
@SP
M=M-1

@SP
A=M
D=M
@THIS
M=D
//pushconstant5001
//*SP=i
@5001
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++
//poppointer1
//SP--
@SP
M=M-1

@SP
A=M
D=M
@THAT
M=D
//pushconstant200
//*SP=i
@200
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++
//poplocal1
//SP--
@SP
M=M-1

//addr=ARG+i
@1
D=A
@LCL
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
//pushconstant40
//*SP=i
@40
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++
//poplocal2
//SP--
@SP
M=M-1

//addr=ARG+i
@2
D=A
@LCL
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
//pushconstant6
//*SP=i
@6
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++
//poplocal3
//SP--
@SP
M=M-1

//addr=ARG+i
@3
D=A
@LCL
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
//pushconstant123
//*SP=i
@123
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++
//callSys.add121
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
@6
D=D-A
@ARG
M=D

@SP
D=M
@LCL
M=D

@Sys.add12
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
//pushlocal0
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
//pushlocal1
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
//pushlocal2
//addr=ARG+i
@2
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
//pushlocal3
//addr=ARG+i
@3
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
//pushlocal4
//addr=ARG+i
@4
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
//add
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
//add
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
//add
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
//add
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
//functionSys.add120
(Sys.add12)
//pushconstant4002
//*SP=i
@4002
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++
//poppointer0
//SP--
@SP
M=M-1

@SP
A=M
D=M
@THIS
M=D
//pushconstant5002
//*SP=i
@5002
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++
//poppointer1
//SP--
@SP
M=M-1

@SP
A=M
D=M
@THAT
M=D
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
//pushconstant12
//*SP=i
@12
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++
//add
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


