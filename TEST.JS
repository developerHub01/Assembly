/* org 100h

include "emu8086.inc"


STR DB "SAMPLE", 0;

MOV BX, 0;
MOV CX, 0
MOV DL, 0
MOV SI, 0    
    
    
START:
    GET_LENGTH
                        
GET_LENGTH:          
    CMP STR[SI], 0;
    JE MANAGE_INDEXS;
    
    INC SI;
    JMP GET_LENGTH  
    
MANAGE_INDEXS:   
    MOV BX, 0;
    MOV CX, SI;
    DEC CX;
    
    MOV SI, 0
    JMP REVERSE_STRING;    
    
REVERSE_STRING:
    CMP BX, CX;
    JGE PRINT_STRING
                 
    MOV SI, BX;
    MOV DL, STR[SI];
    
    MOV SI, CX;
    MOV DH, STR[SI];
        
    
    MOV SI, BX    
    STR[SI], DH; 
    
    MOV SI, CX    
    STR[SI], DL;
    
    INC BX;
    DEC CX;
    
    MOV SI, 0;
    
    JMP REVERSE_STRING;
    

PRINT_STRING:
    MOV 
    INC SI
     
    

DEFINE_PRINT_NUM_UNS;
     */