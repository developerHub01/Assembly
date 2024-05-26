ORG 100H

INCLUDE "EMU8086.INC"

LIMIT DB 10, 11, 1 ;; START, END, MAX_VALUE
STEPS DB 0        ;; NUMBER OF STEPS RUNNING 
MAIN_LOOP_INDEX DB 10        ;; MAIN LOOP INDEX             
        
MOV AX, 0 ;; FOR OPERATIONS
MOV BL, 0 
MOV CX, 10  ;; CURRENT NUMBER
MOV DX, 0 
          

JMP START


EVEN_ODD_CHECKER: 
    MOV AL, STEPS[0]
    INC AL;
    
    MOV STEPS[0], AL     
    
    MOV AX, CX 
    
    MOV BX, 2
         
    PRINT "VALUE === "    
    CALL PRINT_NUM_UNS                   
    PRINTN 
     
    DIV BX
    MOV AL, AH 
    ;PRINT "REMINDER ----------->"  
    ;CALL PRINT_NUM_UNS
    ;PRINTN
    
    TEST DX, DX
    JZ EVEN
    JMP ODD
    ;CMP AL, 0
    ;JE ODD;
    ;JMP EVEN 
        
 
EVEN:  
    PRINT "EVEN VALUE ----------->"  
    PRINTN
    MOV AX, CX
    MOV BX, 3;
    MUL BX
    
    MOV CX, AX
    
    INC CX 
    
    MOV AX, CX   
    
    PRINT " EVEN "
    CALL PRINT_NUM_UNS
    PRINTN
    
    JMP STEP_COUNTER_LOOP
    
    
ODD:     
    PRINT "ODD VALUE ----------->" 
    PRINTN
    MOV AX, CX
    MOV BX, 2                   
    
    DIV BX
    MOV CX, AX 
    
         
    PRINT " ODD "     
    CALL PRINT_NUM_UNS
    PRINTN     
    PRINT "=================="
    PRINTN
    
    JMP STEP_COUNTER_LOOP
              

IF_CURRENT_STEPS_IS_MAX:
    MOV AL, STEPS[0];
    MOV LIMIT[2], AL;   
    MOV STEPS[0], 0 
    
    JMP START;  
              
              
STEP_COUNTER_LOOP_FINISHER:
    MOV AL, STEPS[0];
    MOV AH, LIMIT[2] 
    CMP AL, AH
    JG IF_CURRENT_STEPS_IS_MAX;
    JMP START
     
    
STEP_COUNTER_LOOP:
    CMP CX, 1;
    JE STEP_COUNTER_LOOP_FINISHER;
    JMP EVEN_ODD_CHECKER   
      
STEP_COUNTER_LOOP_START:
    MOV STEPS[0], 1           
    MOV AL, MAIN_LOOP_INDEX[0]
    INC AL;
    MOV MAIN_LOOP_INDEX[0], AL 
    JMP STEP_COUNTER_LOOP; 
  
    
START:
    MOV AL, MAIN_LOOP_INDEX[0]; 
    MOV AH, LIMIT[1];  
    CMP AL,AH
    JG FINISH;  
    JMP STEP_COUNTER_LOOP_START 


    
    
 
FINISH:
    PRINT "RESULT == "
    MOV AL, LIMIT[0];
    CALL PRINT_NUM_UNS;
    PRINT " "
    MOV AL, LIMIT[1];
    CALL PRINT_NUM_UNS;
    PRINT " "
    MOV AL, LIMIT[2];
    CALL PRINT_NUM_UNS; 
     
  

    

DEFINE_PRINT_NUM_UNS
END;     




;const getNumberOfSteps = (num) => {
;  let step = 1;
;  while (num !== 1) {
;    if (num % 2) num = 3 * num + 1;
;    else num /= 2;
;    step++;
;  }
;  return step;
;};
;
;const uva100 = (low, heigh) => {
;  let maxV = 0;
;  for (let i = low; i <= heigh; i++) {
;    const value = getNumberOfSteps(i);
;    if (value > maxV) {
;      maxV = value;
;    }
;  }
;  return [low, heigh, maxV];
;};