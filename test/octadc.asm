
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

.model small
.stack 100h
.data

cr equ 0dh
lf equ 0ah

inp db ?

.code

main proc
    mov ax,@data
    mov ds,ax
    
    
    mov ah,1
    int 21h
    mov inp,al
    
    mov ah,2
    mov dl,cr
    int 21h
    mov dl,lf
    int 21h
    
    mov bl,120
    
    sub bl,inp
    
    mov ah,2
    mov dl,49 
    int 21h
    mov dl,bl
    int 21h
    
    
    mov ah,4ch
    int 21h
    
    
    
    
    main endp
end main




