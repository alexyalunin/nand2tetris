
//*SP=i
@17
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++

//*SP=i
@17
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
@LABEL1
D;JEQ
@SP
A=M
M=0
@LABEL2
0;JMP
(LABEL1)
@SP
A=M
M=-1
(LABEL2)
@SP
M=M+1

//*SP=i
@17
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++

//*SP=i
@16
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
@LABEL3
D;JEQ
@SP
A=M
M=0
@LABEL4
0;JMP
(LABEL3)
@SP
A=M
M=-1
(LABEL4)
@SP
M=M+1

//*SP=i
@16
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++

//*SP=i
@17
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
@LABEL5
D;JEQ
@SP
A=M
M=0
@LABEL6
0;JMP
(LABEL5)
@SP
A=M
M=-1
(LABEL6)
@SP
M=M+1

//*SP=i
@892
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++

//*SP=i
@891
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
@LABEL7
D;JLT
@SP
A=M
M=0
@LABEL8
0;JMP
(LABEL7)
@SP
A=M
M=-1
(LABEL8)
@SP
M=M+1

//*SP=i
@891
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++

//*SP=i
@892
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
@LABEL9
D;JLT
@SP
A=M
M=0
@LABEL10
0;JMP
(LABEL9)
@SP
A=M
M=-1
(LABEL10)
@SP
M=M+1

//*SP=i
@891
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++

//*SP=i
@891
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
@LABEL11
D;JLT
@SP
A=M
M=0
@LABEL12
0;JMP
(LABEL11)
@SP
A=M
M=-1
(LABEL12)
@SP
M=M+1

//*SP=i
@32767
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++

//*SP=i
@32766
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
@LABEL13
D;JGT
@SP
A=M
M=0
@LABEL14
0;JMP
(LABEL13)
@SP
A=M
M=-1
(LABEL14)
@SP
M=M+1

//*SP=i
@32766
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++

//*SP=i
@32767
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
@LABEL15
D;JGT
@SP
A=M
M=0
@LABEL16
0;JMP
(LABEL15)
@SP
A=M
M=-1
(LABEL16)
@SP
M=M+1

//*SP=i
@32766
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++

//*SP=i
@32766
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
@LABEL17
D;JGT
@SP
A=M
M=0
@LABEL18
0;JMP
(LABEL17)
@SP
A=M
M=-1
(LABEL18)
@SP
M=M+1

//*SP=i
@57
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++

//*SP=i
@31
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++

//*SP=i
@53
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

//*SP=i
@112
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

@SP
M=M-1
A=M
M=-M
@SP
M=M+1

@SP
M=M-1
A=M
D=M//D=y
@SP
M=M-1
A=M//M=x
D=D&M
M=D//stacknowpointstosum
@SP
M=M+1

//*SP=i
@82
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
D=D|M
M=D//stacknowpointstosum
@SP
M=M+1

@SP
M=M-1
A=M
M=!M
@SP
M=M+1
