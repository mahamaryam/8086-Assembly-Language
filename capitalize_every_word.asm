.model small
.stack 
.data
arr db 50 dup(?)
msg db "Enter sentence:$"
.code
main proc
    
    mov ax,@data
    mov ds,ax
    mov dx,offset msg
    mov ah,9
    int 21h
    mov dl,13
    mov ah,2
    int 21h
    mov dl,10
    mov ah,2
    int 21h
    lea si,arr
    mov cx,50
    loopp:
    mov ah,1
    int 21h
    mov [si],al
    inc si
    dec cx
    jnz loopp
    
    sub si,50
    mov cx,50
    mov dl,13
    mov ah,2
    int 21h
    mov dl,10
    mov ah,2
    int 21h
    
    loop1:
    cmp [si],32
    je true
    
    jmp exit
    
    true:
    inc si
    dec cx
    sub [si],32
    exit:
    inc si
    
    loop loop1
    
    mov cx,50
    sub si,50
    loopx:
    mov dl,[si]
    mov ah,2
    int 21h
    inc si
    loop loopx
    
    main endp
end main
