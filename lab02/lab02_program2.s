.data
ifmap: .byte 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25
kernel: .byte 1,1,1,1,1,1,1,1,1
ofmap: .space 9

.text
MAIN:   daddi R1,R0,0
        daddi R4,R0,0
        daddi R2,R0,3
        daddi R3,R0,3
        daddi R9,R0,5
        daddi R10,R0,3
        daddi R11,R0,0
        daddi R12,R0,3
        daddi R13,R0,0
        daddi R14,R14,0
        daddi R15,R0,3
        daddi R16,R0,0

OUT_RIGHE:

OUT_COLONNE:

IN_RIGHE:

IN_COLONNE:

        lb R5,ifmap(R1)      
        lb R6,kernel(R4)      
        dmul R7,R5,R6      
        dadd R8,R8,R7      

        daddui R1,R1,1      
        daddui R4,R4,1      
        daddui R2,R2,-1     

        bnez R2,IN_COLONNE        

        daddui R11,R11,1    
        dmul R1,R9,R11      
        dadd R1,R1,R14      

        dmul R17,R16,R9     
        dadd R1,R1,R17      

        dmul R4,R10,R11     
        

        daddui R3,R3,-1     
        daddui R2,R0,3      
        bnez R3,IN_RIGHE        
        daddui R14,R14,1    
        dadd R1,R17,R14      

        
        daddui R4,R0,0 
        daddui R3,R0,3 
        daddui R2,R0,3
        daddui R11,R0,0
        

        sb R8,ofmap(R13)
        daddui R13,R13,1 

        daddui R8,R0,0      
        daddui R12,R12,-1   
        
        bnez R12,OUT_COLONNE    
        
        
        ; Reset 
        daddui R4,R0,0 
        daddui R3,R0,3 
        daddui R2,R0,3
        daddui R11,R0,0
        daddui R8,R0,0  
        daddui R12,R0,3   
        daddui R14,R0,0   

        daddui R16,R16,1      
        dmul R1,R16,R9        

        daddui R15,R15,-1
        bnez R15,OUT_RIGHE   
        HALT


