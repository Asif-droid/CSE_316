
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

.model small
.stack 100h
.data
cr equ 0dh
lf equ 0ah
ar dw 10 dup(?) 
ix dw ?
i dw ? 
m1 db 'not found$'
m2 db 'found$'
v dw ?
N dw ?
.code

main proc
    mov ax,@data
    mov ds,ax
    
    
    ; fast BX = 0
    XOR BX, BX
    
    INPUT_LOOP:
    ; char input 
    MOV AH, 1
    INT 21H
    
    ; if \n\r, stop taking input
    CMP AL, CR    
    JE END_INPUT_LOOP
    CMP AL, LF
    JE END_INPUT_LOOP
    
    ; fast char to digit
    ; also clears AH
    AND AX, 000FH
    
    ; save AX 
    MOV CX, AX
    
    ; BX = BX * 10 + AX
    MOV AX, 10
    MUL BX
    ADD AX, CX
    MOV BX, AX
    JMP INPUT_LOOP
    
    END_INPUT_LOOP:
    MOV N, BX
    
    MOV AH, 2
    MOV DL, CR
    INT 21H
    MOV DL, LF
    INT 21H  
     
;    mov ah,1
;    int 21h
;    
;    and ax,000fh
;    mov cx,ax
;    mov i,cx 

    mov cx,N
    mov i,cx
    
    
    
    
    
    
    lea si,ar
    input:
    
    XOR BX, BX
    
    INPUT_LOOP2:
    ; char input 
    MOV AH, 1
    INT 21H
    
    ; if \n\r, stop taking input
    CMP AL, CR    
    JE END_INPUT_LOOP2
    CMP AL, LF
    JE END_INPUT_LOOP2
    
    ; fast char to digit
    ; also clears AH
    AND AX, 000FH
    
    ; save AX 
    MOV DX, AX
    
    ; BX = BX * 10 + AX
    MOV AX, 10
    MUL BX
    ADD AX, DX
    MOV BX, AX
    JMP INPUT_LOOP2
    
    END_INPUT_LOOP2:
    MOV N, BX
    
    MOV AH, 2
    MOV DL, CR
    INT 21H
    MOV DL, LF
    INT 21H
    
    
    mov [si],BX
    add si,2 
    loop input
    
    
    sort:
    lea si,ar 
    mov ix,si
    mov cx,i
    dec cx
    
    add si,2
    oloop:
    mov ax,[si]
    mov di,si
    sub di,2
    iloop:
    cmp di,ix
    jl exiti
    cmp [di],ax
    jle exiti
            
    mov bx,[di]
    add di,2
    
    mov [di],bx
    sub di,2         
    sub di,2
    jmp iloop
    
    exiti:
    add di,2
    mov [di],ax
    add si,2
    loop oloop
    
    
    mov ah,2
    mov dl,cr
    int 21h
    mov dl,lf
    int 21h
    
    
    lea di,ar
    
    
    mov cx,i
   
   
    output: 
    mov ah,2
    mov dx,[di]
    int 21h 
    add di,2
    loop output
    
    mov ah,2
    mov dl,cr
    int 21h
    mov dl,lf
    int 21h 
    
    
    ;input for bst
    
    mov ah,1
    int 21h
    mov cx,ax 
    
     

    
    mov bx,0
    mov dx,i
    dec dx
    
    bs: 
    lea si,ar
    cmp bx,dx
    jg exitn
    mov ax,bx
    add ax,dx
    
    shr ax,1
    mov v,ax 
    
    
    
    add ax,ax
    
    add si,ax
    
    cmp cx,[si]
    
    jge gr
    mov ax,v
    sub ax,1
    mov dx,ax 
    
    mov ah,2
    int 21h
    jmp bs
    
    
    gr:
    cmp cx,[si]
    je exitf
    mov ax,v
    add ax,1
    mov bx,ax
    mov ah,2
    int 21h
    jmp bs
    
    
    exitn:
    mov ah,2
    mov dl,cr
    int 21h
    mov dl,lf
    int 21h
    
    lea dx,m1
    mov ah,9
    int 21h 
    jmp e
     
    
    exitf:
    mov ah,2
    mov dl,cr
    int 21h
    mov dl,lf
    int 21h
    
    lea dx,m2
    mov ah,9
    int 21h
    e:
    mov ah,4ch
    int 21h
    main endp
end main



