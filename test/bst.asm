
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

.model small
.stack 100h
.data
m1 db 'not f $'
m2 db 'found $'
v dw ?
ar dw 10 dup(?)
.code
main proc
    mov ax,@data
    mov ds,ax
    
    lea si,ar
    mov cx,5
    input:
    mov ah,1
    int 21h
    mov [si],ax
    add si,2
    loop input
    
    lea si,ar
    mov cx,5
    
    output:
    mov ah,2
    mov dx,[si]
    int 21h
    add si,2
    loop output
    
    
    mov ah,1
    int 21h
    mov cx,ax 
    
     

    
    mov bx,0
    mov dx,4
    
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
    lea dx,m1
    mov ah,9
    int 21h 
    jmp e
     
    
    exitf:
    lea dx,m2
    mov ah,9
    int 21h
    e:
    mov ah,4ch
    int 21h
    
    
    
    
    
    main endp
end main
 




