
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

.model small
.stack 100h
.data 

x db ?
y db ?
.code

main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,1
    int 21h
    mov x,al
    
    not x
    
    
    mov ah,2
    mov dl,x
    int 21h
    
    mov ah,4ch
    int 21h
    
    
    main endp
end main



