;Code written by Gabor Sebastian and Efrem Dragos-Sebastian-Mihaly for Computer Organisation project
;Calculates the value of the Fibonacci number given it's position in the sequence and stores that value in register 3 (R3)
;R0 - special register for the value 0
;R1 - stores the first term of summation in fibonacci formula
;R2 - stores the secodn term of summation in fibonacci formula
;R3 - result of fibonacci sumation, also stores the result (n-th fibonacci number)
;R6 - the position in the fibonacci sequence of the number to be calculated

MAIN:   ADDI R1,R0,1    ; Initial value of the first element to be added
        ADDI R2,R0,1    ; Initial value of the secodn element to be added
        ADDI R6,R0,10   ; Storing the position in the fibonacci sequence
VERIFY: ; Scope of label is to fix issues when the position is 0, 1 or 2
        BZ R6,EXIT  ; if the position is 0 from the start then go straight to exit
        NOP
        SUB R6,R6,R1
        BZ R6,IF_EQUALS_ZERO ; if the position is 1 from the start then go to register corrector label IF_EQUALS_ZERO
        NOP
        SUB R6,R6,R2
        BZ R6,IF_EQUALS_ZERO ; if the position is 2 from the start then go to register corrector label IF_EQUALS_ZERO
        NOP

IF_EQUALS_ZERO:   ; used to add 1 to the third register in case the position is 1 or 2
        ADD R3, R0, R1
        BZ R6,EXIT
        NOP

LOOP:   BZ R6,EXIT    ;   if the iterator is 0 then go to exit
        NOP
        ADD R3,R2,R1  ; R3 = R2 + R1
        ADDI R1,R2,0  ; R1 gets the old value of R2
        ADDI R2,R3,0  ; R2 gets the old value of R3
        ADDI R6,R6,-1 ; Subtract 1 from the iterator
        BZ R0,LOOP    ; Redo the loop
        NOP
EXIT:   BZ R0,EXIT  ; Exit the program
        NOP