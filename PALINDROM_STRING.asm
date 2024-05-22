org 100h
include "emu8086.inc"
 
 
STR DB "1233321", '$'  

MOV AX, 0
MOV SI, 0
MOV BX, 0 
MOV CX, 0


GET_LENGTH:
    CMP STR[SI], '$'  
    JE MANAGE_INDEX              
    INC SI       
    JMP GET_LENGTH
 
MANAGE_INDEX:  
    MOV BX, 0;
    MOV CX, SI;
    DEC CX;
    MOV SI, 0;
    JMP CHECK_PALINDROME
           
CHECK_PALINDROME:
    CMP BX, CX;
    JGE PRINT_PALINDROME
    MOV SI, BX;
    MOV AL, STR[SI]
    
    MOV SI, CX;
    
    CMP AL, STR[SI]
    JNE PRINT_NOT_PALINDROME;      
    
    INC BX;
    DEC CX;
    JMP CHECK_PALINDROME;
             
PRINT_PALINDROME:    
    PRINT "PALINDROME";
    JMP DONE;
             

PRINT_NOT_PALINDROME:
    PRINT "NOT PALINDROME";
    JMP DONE;                      
    
DONE:

    

DEFINE_PRINT_NUM_UNS; 
 
END
      