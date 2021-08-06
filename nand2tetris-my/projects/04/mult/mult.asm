// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// a = R0
// b = R1
// sum = 0
// for (i=0, i<b, i++) {
//     sum += a
// }

// init sum = 0
@sum
M=0
@R2
M=0

// init i = 0
@i
M=0


(LOOP)
// if i == b goto end
@i
D=M
@R1
D=D-M
@STOP
D;JEQ

// mult
@i
M=M+1

@sum
D=M
@R0
D=D+M
@sum
M=D

@LOOP
0;JMP

(STOP)
@sum
D=M
@R2
M=D

(END)
@END
0;JMP