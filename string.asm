org 100h
include "emu8086.inc"
 
 
STR DB "ASDFSAFSD", 0  

MOV SI, 0
MOV BX, 0 
MOV CX, 0


GET_LENGTH:
    CMP STR[SI], 0
    JE GET_HALF_LENGTH              
    INC SI       
    JMP GET_LENGTH
                                       

GET_HALF_LENGTH:     
    MOV AX, SI ; SI IS THE LENGTH 
    MOV BX, 2;         
    
    DIV BX;
    
    MOV BX, AX ; BX IS THE HALF OF LENGTH  
    MOV CX, 0

    JMP CHECK_PALINDROM;
         
                     
    
               
CHECK_PALINDROM:
    MOV AX, CX
    PRINT "LEFT INDEX 1 == "
    CALL PRINT_NUM_UNS
    PRINTN;    
    
    MOV AX, CX
    PRINT "LEFT INDEX 2 == "
    CALL PRINT_NUM_UNS
    PRINTN;
    
    MOV AX, SI
    SUB AX, CX
    SUB AX, 1
    PRINT "RIGHT INDEX == "
    CALL PRINT_NUM_UNS
    PRINTN; 
              
               
    CMP STR[CX], STR[AX];
    JNE PRINT_NOT_PALINDROM
    
    CMP CX, BX
    JE PRINT_PALINDROM;    
 
    INC CX
    
    JMP CHECK_PALINDROM
    
        
            
        
             
PRINT_PALINDROM:    
    PRINT "PALINDROM";
    JMP DONE;
             

PRINT_NOT_PALINDROM:
    PRINT "NOT PALINDROM";
    JMP DONE;                      
    
DONE:

    

DEFINE_PRINT_NUM_UNS; 
 
END
      