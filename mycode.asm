Data  SEGMENT   ; START A SEGMENT BY A NAME OF DATA
    A DW 8A5CH  ; DECLARATION
    B DW F39AH   ;DECLARATION
    SUM DW ?      ;DECLARATION
    Carry DB 00H   ;DECLARATION                                
Data ENDS 
    
Code SEGMENT
    ASSUME CS:Code, DS:Data ; INFORM THE ASSEMBLER ABOUT CORRECT SEGMENTS 
START:
    MOV AX,Data ; PUT SEGMENT ADDRESS OF DATA INTO AX
    MOV DS,AX  ; TRANSFER SEGMENT ADDRESS OF DATA FROM AX TO DS
    
    MOV AX,A
    ADD AX,B
    JNC Skip 
    MOV Carry, 01H ; Set carry flag
Skip:MOV SUM,AX
    
    MOV AH,4CH ;   End the program, go back to OS
    INT 21H

Code ENDS

END START