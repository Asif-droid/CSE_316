
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
m1 db 'not found $'
m2 db 'found $' 
m3 db 'input array size $'
m4 db 'to find enter num to strt new enter a $'
v dw ? 
negf1 dw ?
negf2 dw ?
pos1 dw ? 

pos2 dw ?


        
        
ar dw 50 dup(?)
.code
main proc
    mov ax,@data
    mov ds,ax
    
    start:
    mov ah,2
    mov dl,cr
    int 21h
    mov dl,lf
    int 21h
    lea dx,m3
    mov ah,9
    int 21h
     
     xor bx,bx
     mov negf1,0
    inputchar1: 
    
    
    
    mov ah,1
    int 21h
    cmp al,cr
    je endinputchar1
    cmp al,lf
    je endinputchar1
    cmp al,'-'
    jne nonneg
    mov negf1,1
    jmp inputchar1
    
    nonneg:
    and ax,000fh
    mov var,ax
    mov ax,10
    mul bx
    add ax,var
    mov bx,ax
    
    jmp inputchar1
    
    
    
    endinputchar1:
    cmp negf1,1
    jne end1
    neg bx
    
    
    end1:
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
    mov negf2,0
    inputchar:
    
    
    mov ah,1
    int 21h
    cmp al,cr
    je endinputchar
    cmp al,lf
    je endinputchar
    cmp al,'-'
    jne nonneg2
    mov negf2,1
    jmp inputchar
    
    
    nonneg2:
    and ax,000fh
    mov var,ax
    mov ax,10
    mul bx
    add ax,var
    mov bx,ax
    
    jmp inputchar
    
    
    
    endinputchar:
    cmp negf2,1
    jne end2
    neg bx 
    
    
    end2:
    mov ah,2
    mov dl,cr
    int 21h
    mov dl,lf
    int 21h
    ;neg bx
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
    
    
    
    
    
    
    
    
    
    
    ;lea si,ar
;    mov cx,n
;    output:
;    mov ah,2
;    mov bx,[si]
;    mov dx,bx
;    int 21h
;    add si,2
;    loop output
    
    
    mov ah,2
    mov dl,cr
    int 21h
    mov dl,lf
    int 21h 
    
    call show_ar 
    
    mov ah,2
    mov dl,cr
    int 21h
    mov dl,lf
    int 21h
    
    
    
    
    
    
    
    
    ;input for bs
    bsin:
    lea dx,m4
    mov ah,9
    int 21h
     mov ah,2
    mov dl,cr
    int 21h
    mov dl,lf
    int 21h 
    xor bx,bx 
    mov negf1,0
    inputchar2: 
    
    
    
    
    mov ah,1
    int 21h
    cmp al,'a'
    je start
    cmp al,cr
    je endinputchar2
    cmp al,lf
    je endinputchar2
    cmp al,'-'
    jne nonneg3
    mov negf1,1
    jmp inputchar2
    
    
    
    nonneg3:
    and ax,000fh
    mov var,ax
    mov ax,10
    mul bx
    add ax,var
    mov bx,ax
    
    jmp inputchar2
    
    
    
    endinputchar2:
    cmp negf1,1
    jne end3
    neg bx
    end3:
    mov ah,2
    mov dl,cr
    int 21h
    mov dl,lf
    int 21h 
    ;mov dx,bx
;    int 21h 
    
    
    
    
    
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
    jmp bsin
     
    
    exitf:
    lea dx,m2
    mov ah,9
    int 21h
    mov bx,v
    inc bx
    call print_single_num
    
    jmp bsin
   
                  
    
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
    
    
    show_ar proc
    lea si,ar
    mov pos1,si
    mov ax,n
    mov pos2,ax
    sub pos2,1
    mov ax,2
    mul pos2
    mov pos2,ax
    mov ax,pos1
    add pos2,ax   
    print_num:
    mov si,pos1
    mov bx,[si]
    call print_single_num
    add pos1,2
    mov ax,pos2
    cmp pos1,ax
    jle print_num           
    ret 
    show_ar ENDP

  
  
  
    print_single_num PROC   
    
    
    cmp bx,0
    jge nonneg_num
    mov dl,'-'
    mov ah,2
    int 21h
    neg bx 
    nonneg_num:
    
    mov ax,bx
    mov bx, 10D
     
    xor cx, cx 
    cloop:
	xor dx, dx 
	div bx 
	push dx
	inc cx 
	cmp ax, 0 
	jne cloop
    print_loop:
	pop dx 
	add dx, '0'
	MOV ah, 2
	int 21h
	loop print_loop               
    
    mov dl,' '
    mov ah,2
    int 21h               
    ret               
    print_single_num ENDP
    
    
    
end main




