.model small
.stack
.data
arr db 10 dup(?)
msg db "Enter Array: $"
msg2 db "Array is Monotonic Increasing $"
msg3 db "Array is not Monotonic$"
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
    mov cx,10
    loop1:
    mov ah,1
    int 21h
    mov [si],al
    inc si
    dec cx
    jnz loop1
    sub si,10
    mov cx,9 
    
    monotonic:
    mov bl,[si]
    inc si
    mov al,[si]
    cmp bl,al
    jbe true
    
    mov dx,offset msg3
    mov ah,9
    int 21h
    mov ah,4ch
    int 21h
    
    true:
    dec cx 
    jnz monotonic
    
    mov dx,offset msg2
    mov ah,9
    int 21h
    mov ah,4ch
    int 21h
  
    main endp
end main
