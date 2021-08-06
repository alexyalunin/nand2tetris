// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
// while True:
//     if KBD == 0:
//         for pixel in pixel:
//             fill(0)
//     else:
//         for pixel in pixel:
//             fill(1)

@8192
D=A
@n // n=8192
M=D


(LOOPKBD)
    @SCREEN
    D=A
    @addr
    M=D

    @i 
    M=0 // i=0

    @KBD
    D=M
    // if D is 0 jump to loop
    @LOOPWHITE
    D;JEQ
    
    (LOOPBLACK)
        // if i(0) == n(8192)
        @i
        D=M
        @n
        D=D-M
        @LOOPKBD
        D;JGE

        @addr
        A = M // A = RAM[addr]
        M = -1

        @i
        M=M+1
        @addr
        M=M+1

        @LOOPBLACK
        0;JMP

    
    (LOOPWHITE)
        // if i(0) == n(8192)
        @i
        D=M
        @n
        D=D-M
        @LOOPKBD
        D;JGE

        @addr
        A = M // A = RAM[addr]
        M = 0

        @i
        M=M+1
        @addr
        M=M+1

        @LOOPWHITE
        0;JMP






