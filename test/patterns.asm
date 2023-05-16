
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

.model small
.stack 100h
.data
cr equ 0dh
lf equ 0ah

st db "*****$"
mid db "**$"
a db "*$"

inp1 db ?
inp2 db ? 
inp3 db ?

.code
main proc 
    mov ax,@data
    mov ds,ax
    
    mov ah,1
    int 21h
    mov inp1,al
    mov ah,1
    int 21h
    mov inp2,al
    mov ah,1
    int 21h
    mov inp3,al 
    
    
    mov ah,2
    mov dl,cr
    int 21h
    mov dl,lf
    int 21h
    
    lea dx,st
    mov ah,9
    int 21h 
    
    mov ah,2
    mov dl,cr
    int 21h
    mov dl,lf
    int 21h
    
    lea dx,st
    mov ah,9
    int 21h   
    
    mov ah,2
    mov dl,cr
    int 21h
    mov dl,lf
    int 21h
    
    lea dx,mid
    mov ah,9
    int 21h 
    
    mov ah,2
    mov dl,inp1
    int 21h
    
    lea dx,mid
    mov ah,9
    int 21h 
    
    mov ah,2
    mov dl,cr
    int 21h
    mov dl,lf
    int 21h
    
    mov ah,2
    mov dl,'*'
    int 21h
    mov dl,inp1
    int 21h
    mov dl,inp2
    int 21h
    mov dl,inp3
    int 21h
    mov dl,'*'
    int 21h
    
    mov ah,2
    mov dl,cr
    int 21h
    mov dl,lf
    int 21h 
    
    lea dx,mid
    mov ah,9
    int 21h 
    
    mov ah,2
    mov dl,inp3
    int 21h
    
    lea dx,mid
    mov ah,9
    int 21h 
    
    mov ah,2
    mov dl,cr
    int 21h
    mov dl,lf
    int 21h
    
    lea dx,st
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,cr
    int 21h
    mov dl,lf
    int 21h
    
    lea dx,st
    mov ah,9
    int 21h
    
    
    
    mov ah,4ch
    int 21h
    main endp
end main




