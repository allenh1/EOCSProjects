// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.
	@SCREEN
	M=0
(KEYCHECK)
	@24576
	D=M
	@SETBLACK
	D; JGT
(SETWHITE)
	@R3
	M=0
	@COLORIZE
	0; JMP
(SETBLACK)
	@R3
	M=-1
	@COLORIZE
	0; JMP
(COLORIZE)
	@R3
	D=M
	@SCREEN
	M=D
	@SCREEN
	D=A
	@R1
	M=D
(LOOOP)
	@R3
	D=M
	@R1
	A=M
	M=D
	D=M
	@SCREEN
    D=D+M
	@24575  // If we have reached the end, then jump.
	D=D-A
	@KEYCHECK
	D; JEQ
	@R1
	D=M
	@1
	D=D+A
	@R1
	M=D
	@LOOOP
	0;JMP
