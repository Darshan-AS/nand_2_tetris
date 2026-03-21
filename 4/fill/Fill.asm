// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

// Pseudocode:
//     start = SCREEN
//     i = 0
//     n = 8192  // the number of 16-bit words on the screen

// LOOP:
//     if i >= n: goto END

//     A = start + i

//     pressed = KBD
//     if pressed == 0, goto CLEAR
//     R[A] = -1  // blacken the pixel at address A

// CLEAR:
//     R[A] = 0   // clear the pixel at address A

//     i = i + 1
//     goto LOOP
// END:
//     i = 0
//     goto LOOP

    @SCREEN
    D=A              // D = start (the base address of the screen)
    @start
    M=D              // start = SCREEN

    @i
    M=0

    @8192            // D = 8192 (the number of pixels on the screen)
    D=A
    @n
    M=D              // n = 8192

(LOOP)
    @i
    D=M              // D = i
    @n
    D=D-M            // D = i - n
    @END
    D;JEQ            // if i >= n, goto END

    @start
    D=M              // D = start
    @i
    D=D+M            // D = start + i
    @address
    M=D              // address = start + i
        
    @KBD
    D=M             // D = pressed (the key code of the pressed key, or 0 if no key is pressed)
    @CLEAR
    D;JEQ           // if pressed == 0, goto CLEAR, otherwise continue to blacken the pixel

(BLACK)
    @address
    A=M              // A = address
    M=-1             // blacken the pixel at address A
    @CONT
    0;JMP

(CLEAR)
    @address
    A=M              // A = address
    M=0              // clear the pixel at address A
    
(CONT)
    @i
    M=M+1            // i = i + 1

    @LOOP
    0;JMP            // goto LOOP

(END)
    @i
    M=0
    @LOOP
    0;JMP            // goto LOOP

