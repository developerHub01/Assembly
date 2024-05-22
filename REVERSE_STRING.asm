org 100h

include "emu8086.inc"


STR DB "SAMPLE", '$';

MOV BX, 0;
MOV CX, 0
MOV DL, 0
MOV SI, 0    

;;JMP PRINT_STRING  
    
START:
    JMP GET_LENGTH 
      
    ;JMP PRINT_STRING
                        
GET_LENGTH:          
    CMP STR[SI], '$';
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
    MOV STR[SI], DH; 
    
    MOV SI, CX    
    MOV STR[SI], DL;
    
    INC BX;
    DEC CX;
    
    MOV SI, 0;
    
    JMP REVERSE_STRING;
    

PRINT_STRING:       
    ;MOV AL, STR[SI];
    
    ;CALL PRINT_NUM_UNS
    ;INC SI; 
    ;JMP PRINT_STRING 
    
    LEA DX, STR;
    MOV AH, 09H
    INT 21H
     
    

DEFINE_PRINT_NUM_UNS;   
END;