ORG 100H

INCLUDE "EMU8086.INC"

LIMIT DB 10, 11, 1 ;; START, END, MAX_VALUE
STEPS DB 0        ;; NUMBER OF STEPS RUNNING 
MAIN_LOOP_INDEX DB 10        ;; MAIN LOOP INDEX             
        
MOV AX, 0 ;; FOR OPERATIONS
MOV BL, 0 
MOV CX, 0
MOV DX, 10 ;; CURRENT NUMBER
          

JMP START


EVEN_ODD_CHECKER: 
    MOV AL, STEPS[0]
    INC AL;
    
    MOV STEPS[0], AL     
         

    MOV AX, DX
    MOV CX, 2                   
    
    DIV CX
    CMP AL, 0
    JE ODD;
    CMP AL, 1
    JE EVEN 
        
 
EVEN: 
    MOV DX, 10
    MOV CX, 3;
    MUL CX
    INC DX 
    
    MOV AX, DX
    
    CALL PRINT_NUM_UNS
    PRINT " "
    
    JMP STEP_COUNTER_LOOP
    
    
ODD:    
    MOV AX, DX
    MOV CX, 2                   
    
    DIV CX
    MOV DX, AX 
    
    MOV AX, DX
    
    CALL PRINT_NUM_UNS
    PRINT " "
    
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
    
    JMP IF_CURRENT_STEPS_IS_MAX;
     
    
STEP_COUNTER_LOOP:
    CMP DX, 1;
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