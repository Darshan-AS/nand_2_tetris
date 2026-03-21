// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

// Pseudocode:
//     a = R0
//     b = R1
//     R2 = 0

//     product = 0
//     i = 0

// LOOP:
//     if i > b: goto STOP

//     product = product + a
//     i = i + 1

//     goto LOOP

// STOP:
//     R2 = product
//     goto END
    
// END:
//     goto END

    @R0
    D=M              // D = R0 (the multiplicand)
    @a
    M=D              // a = R0

    @R1
    D=M              // D = R1 (the multiplier)
    @b
    M=D              // b = R1

    @R2
    M=0              // R2 = 0 (initialize the product)

    @product
    M=0              // product = 0

    @i
    M=0              // i = 0

(LOOP)
    @i
    D=M              // D = i
    @b
    D=D-M            // D = i - b
    @STOP
    D;JEQ            // if i >= b, goto END

    @product
    D=M              // D = product
    @a
    D=D+M            // D = product + a
    @product
    M=D              // product = product + a

    @i
    M=M+1            // i = i + 1
    
    @LOOP
    0;JMP            // goto LOOP

(STOP)
    @product
    D=M              // D = product
    @R2
    M=D              // R2 = product

(END)
    @END
    0;JMP            // infinite loop to end the program
