
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here
.model small
.data
a db 'loop $'
b db ?
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,a
    int 21h  
    
    mov ah,1
    int 21h
    mov b,al
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,2
    mov dl,b
    int 21h
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov cx,10
    mov ah,2
      
    mov dl,48
    l1:
    int 21h
    inc dl
    loop l1 
    
    
    
    mov ah,4ch
    int 21h
    main endp
end main



