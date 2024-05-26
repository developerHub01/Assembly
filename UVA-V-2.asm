ORG 100H

INCLUDE "EMU8086.INC"

SRT_VAL  DW 1 DUP<?>;                                        
CUR_VAL  DW 1 DUP<?>;
END_VAL  DW 1 DUP<?>;
MAX_VAL  DW 1 DUP<?>;
STP_VAL  DW 1 DUP<?>;
NUM_VAL  DW 1 DUP<?>;         

MOV SRT_VAL[0], 1;
MOV CUR_VAL[0], 1;
MOV END_VAL[0], 10;



JMP START 

EVEN:
   MOV AX, NUM_VAL[0]
   MOV BX, 3
   MUL BX
   INC AX;
   MOV NUM_VAL[0], AX;
   JMP GET_NUM_STEPS;

ODD:
   MOV AX, NUM_VAL[0]
   MOV BX, 2
   DIV BX
   MOV NUM_VAL[0], AX;
   JMP GET_NUM_STEPS;

HANDLE_EVEN_ODD: 
   INC STP_VAL[0];
    
   MOV AX, NUM_VAL[0];
   MOV BX, 2;
   DIV BX
   MUL BX
   CMP AX, NUM_VAL[0];
   JE EVEN
   JMP ODD

CHANGE_MAX_VALUE:
   MOV MAX_VAL[0], AX;
   MOV STP_VAL[0], 1;
   JMP START;
      

MANAGE_MAX_VALUE:
   MOV AX, STP_VAL[0];
   MOV BX, MAX_VAL[0];
   CMP AX, BX
   JLE START;
   JMP CHANGE_MAX_VALUE 

GET_NUM_STEPS:
   MOV AX, STP_VAL[0];
   PRINT "STP_VAL ======= "              
   CALL PRINT_NUM_UNS;
   PRINTN ""  
    
   
   MOV AX, NUM_VAL[0];
   PRINT "NUM_VAL ======= "             
   CALL PRINT_NUM_UNS;
   PRINTN ""      
   
   CMP NUM_VAL[0], 1;
   JNE MANAGE_MAX_VALUE;
   JMP HANDLE_EVEN_ODD 


        
START:
   MOV AX, CUR_VAL[0];
   MOV BX, END_VAL[0]; 
   
   PRINT "CUR_VAL ======= "
   CALL PRINT_NUM_UNS;  
   PRINTN ""
   PRINTN "================= "     
   
   
   INC CUR_VAL[0]    ;  CURRENT VALUE LIMIT THAT IS PASSING TO THE ALGO
   MOV STP_VAL[0], 1 ;  TOTAL STEPS FOR THE ALGO. INIT VALUE 1
   MOV NUM_VAL[0], AX;  NUMBER THAT NEED TO TRAVERSE THROUGH THE ALGO
   CMP AX, BX;
   JG FINISH;
   JMP GET_NUM_STEPS
    
    



FINISH:
    PRINT "RESULT == "
    MOV AX, SRT_VAL[0];
    CALL PRINT_NUM_UNS;
    PRINT " "
    MOV AX, END_VAL[0];
    CALL PRINT_NUM_UNS;
    PRINT " "
    MOV AX, MAX_VAL[0];
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