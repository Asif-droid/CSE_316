
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

.model small
.stack 100h
.data
cr equ 0dh
lf equ 0ah
var dw ?
n dw ?
key dw ?
ix dw ?
tem dw ?
m1 db 'not f$'
m2 db 'fou $'
v dw ?
        
        
ar dw 50 dup(?)
.code
main proc
    mov ax,@data
    mov ds,ax
    
    start:
     
     xor bx,bx
    inputchar1:
    
    
    mov ah,1
    int 21h
    cmp al,cr
    je endinputchar1
    cmp al,lf
    je endinputchar1
    
    and ax,000fh
    mov var,ax
    mov ax,10
    mul bx
    add ax,var
    mov bx,ax
    
    jmp inputchar1
    
    
    
    endinputchar1:
    mov ah,2
    mov dl,cr
    int 21h
    mov dl,lf
    int 21h 
    
    mov ax,bx
    mov n,ax
    
    
    ;mov ah,1
;    int 21h
;    and ax,000fh
;    mov n,ax 
    
    cmp ax,0
    jle e
    
    mov ah,2
    mov dl,cr
    int 21h
    mov dl,lf
    int 21h
    
    
    lea si,ar
    mov cx,n
    input:
    
    xor bx,bx
    inputchar:
    
    
    mov ah,1
    int 21h
    cmp al,cr
    je endinputchar
    cmp al,lf
    je endinputchar
    
    and ax,000fh
    mov var,ax
    mov ax,10
    mul bx
    add ax,var
    mov bx,ax
    
    jmp inputchar
    
    
    
    endinputchar:
    mov ah,2
    mov dl,cr
    int 21h
    mov dl,lf
    int 21h
    
    mov [si],bx
    add si,2
    loop input
    
    
    ;sort 
    
    
    sort:
    lea si,ar 
    mov ix,si
    mov cx,n
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
    
    
    
    
    
    
    
    
    
    
    lea si,ar
    mov cx,n
    output:
    mov ah,2
    mov bx,[si]
    mov dx,bx
    int 21h
    add si,2
    loop output
    
    
    mov ah,2
    mov dl,cr
    int 21h
    mov dl,lf
    int 21h 
    
    
    
    
    
    
    
    
    ;input for bs
    xor bx,bx
    inputchar2:
    
    
    mov ah,1
    int 21h
    cmp al,cr
    je endinputchar2
    cmp al,lf
    je endinputchar2
    
    and ax,000fh
    mov var,ax
    mov ax,10
    mul bx
    add ax,var
    mov bx,ax
    
    jmp inputchar2
    
    
    
    endinputchar2:
    mov ah,2
    mov dl,cr
    int 21h
    mov dl,lf
    int 21h 
    mov dx,bx
    int 21h 
    
    
    
    
    
    mov cx,bx 
    
     

    
    mov bx,0
    mov dx,n
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
    
    ;mov ah,2
;    int 21h
    jmp bs
    
    
    gr:
    cmp cx,[si]
    je exitf
    mov ax,v
    add ax,1
    mov bx,ax
    ;mov ah,2
;    int 21h
    jmp bs
    
    
    exitn:
    lea dx,m1
    mov ah,9
    int 21h 
    jmp start
     
    
    exitf:
    lea dx,m2
    mov ah,9
    int 21h
    
    jmp start
   
                  
    
    ;cmp [si],bx
;    je gr:
;    
;    mov ah,9
;    lea dx,m1
;    int 21h
;    jmp ex
;     
;     gr:
;    mov ah,9
;    lea dx,m2
;    int 21h
;    jmp ex
     
    
    
    e:
    
    mov ah,4ch
    int 21h
    
    
    main endp
end main




