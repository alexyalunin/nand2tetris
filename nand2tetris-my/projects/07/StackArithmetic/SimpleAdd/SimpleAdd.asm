
//*SP=i
@7
D=A

@SP
A=M
M=D

@SP
M=M+1//SP++

//*SP=i
@8
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
