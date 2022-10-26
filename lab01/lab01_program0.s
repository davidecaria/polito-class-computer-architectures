.data
a:	.byte 1,2,3,4,5,6,7,8,9,10
	.byte 11,12,13,14,15,16,17,18,19,20
	.byte 21,22,23,24,25,26,27,28,29,30
	.byte 31,32,33,34,35,36,37,38,39,40
b: 	.byte 1,2,3,4,5,6,7,8,9,10
	.byte 11,12,13,14,15,16,17,18,19,20
	.byte 21,22,23,24,25,26,27,28,29,30
	.byte 31,32,33,34,35,36,37,38,39,40
c: .space 40
max: .byte 0
min: .byte 127

.text
MAIN:	daddi R1,R0,40 
		daddi R2,R0,0
		dadd R3,R0,R0
		
		lb R6,max(R0)
		lb R7,min(R0)
		
LOOP:	lb R4,a(R2)
		lb R5,b(R2)
		dadd R3,R4,R5
		sb R3,c(R2)
		
		slt R8,R3,R6
		bnez R8,MAX
		dadd R6,R3,R0	
MAX:	
		
		
		slt R8,R3,R6
		bnez R8,MIN 
		dadd R7,R3,R0
MIN:


		daddi R2,R2,1
		daddi R1,R1,-1
		bnez R1,LOOP
		sb R6,max(R0)
		sb R7,min(R0)
		
		HALT