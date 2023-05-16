
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

.model small
.stack 100h
.data
cr equ 0dh
lf equ 0ah 
d1 dw ?
d2 dw ?
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov bx,0
    
    
    mov ah,1
    int 21h
    and ax,000fh
    mov d1,ax
    mov ax,10
    mul bx
    add ax,d1
    mov bx,ax
    
    mov ah,1
    int 21h
    and ax,000fh
    mov d2,ax 
    mov ax,10
    mul bx
    add ax,d2
    mov bx,ax 
    
    cmp bx,60
    
    jae gre60
    jmp le60
    
    
    gre60:  
    cmp bx,65
    jae gre65
    jmp le65
       
       
       
    le60:
    mov ah,2
    mov dl,'F'
    int 21h
    jmp exit 
    
    gre65:
    cmp bx,70 
    jae gre70
    jmp le70
     
    
    le65:
    mov ah,2
    mov dl,'D'
    int 21h
    jmp exit 
    
    gre70:
    cmp bx,75
    jae gre75
    jmp le75
    
    
    le70:
    mov ah,2
    mov dl,'B'
    int 21h
    jmp exit
    
    gre75:
    cmp bx,80
    jae gre80
    jmp le80
    
    le75:
    mov ah,2
    mov dl,'A'
    int 21h
    mov dl,'-'
    int 21h
    jmp exit
    
    gre80:
    mov ah,2
    mov dl,'A'
    int 21h
    mov dl,'+'
    int 21h
    jmp exit
    
    le80:
    mov ah,2
    mov dl,'A'
    int 21h
    
    jmp exit
    
    
    
    exit: 
    mov ah,4ch
    int 21h
    
    
    main endp
end main




