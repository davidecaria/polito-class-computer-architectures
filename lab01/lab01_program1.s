.data
a: .byte 4,-3,12,9,7,4,-3,1,-3,4,7,9,12,-3,4
f: .space 4

.text
MAIN:   daddi R1, R0, 14 ; right index
        daddi R2, R0, 0 ; left index
        daddi R5, R0, 1 ; flag

LOOP:   lb R3, a(R1)
        lb R4, a(R2)

        beq R3, R4, NEXT
        daddi R5, R5, -1 ; aggiorno il valore
		sb R5, f(R0) ; carico il byte
		HALT
NEXT:


        daddi R1, R1, -1
        daddi R2, R2, 1
        bne R1, R2, LOOP

        sb R5, f(R0) ; carico il byte

        HALT