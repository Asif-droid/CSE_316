
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

.model small
.stack 100h
.data
d1 dw ?
d2 dw ?
a1 dw ?
a2 dw ?
a3 dw ?

m1 db 'equilateral $'
m2 db 'Isoceles $'
m3 db 'Scaiene $'

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
    
    mov a1,bx
    ;2nd arm
    
    
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
    
    mov a2,bx 
    
    ; 3rd arm
    
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
    
    mov a3,bx 
    
    cmp bx,a2
    je ea2a3
    jmp nea2a3
    
    ea2a3:
    mov bx,a1
    cmp bx,a2
    je equil
    jmp iso
    
    nea2a3:
    mov bx,a1
    cmp bx,a2
    je iso
    cmp bx,a3
    je iso
    jmp sca
    
    
    
    
    
    
    equil:
    lea dx,m1
    mov ah,9
    
    int 21h 
    jmp exit
    
    iso: 
    mov ah,9
    lea dx,m2
    int 21h 
    jmp exit
    
    
    sca:
    mov ah,9
    lea dx,m3
    int 21h 
    jmp exit
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    exit:
    mov ah,4ch
    int 21h 
    
    
    
    
    main endp
end main




