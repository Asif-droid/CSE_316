.MODEL SMALL 
.STACK 100H 
.DATA 
.CODE 
MAIN PROC
 ; default decimal 
 MOV AX, 1
 MOV BX, 1
 ADD AX, BX 
  
 ;interrupt to exit
 MOV AH, 4CH
 INT 21H 
  
MAIN ENDP 
END MAIN 