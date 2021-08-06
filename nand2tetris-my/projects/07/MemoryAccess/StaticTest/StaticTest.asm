
//*SP=i
@111
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++

//*SP=i
@333
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++

//*SP=i
@888
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
@StaticTest.8
M=D

//SP--
@SP
M=M-1

@SP
A=M
D=M
@StaticTest.3
M=D

//SP--
@SP
M=M-1

@SP
A=M
D=M
@StaticTest.1
M=D

@StaticTest.3
D=M

@SP
A=M
M=D

@SP
M=M+1//SP++

@StaticTest.1
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

@StaticTest.8
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
