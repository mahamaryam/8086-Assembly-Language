.model small
.stack
.data   
min db 0
arr db 5 dup(?)
result db "Smallest number is $"
msg db "Enter numbers: $"
.code
main proc
    
        mov ax,@data
        mov ds,ax
        mov dx,offset min
        mov dx,offset msg
        mov ah,9
        int 21h
        lea si,arr
        mov cx,5
        input:
        mov ah,1
        int 21h
        mov [si],al
        inc si
        dec cx
        jnz input
        sub si,5  
        mov cx,5
        mov bl,[si]
        mov min,bl ;min has first one
        small:
        mov bl,[si]
        cmp min,bl
        ja new
        jmp there
        new:
        mov min,bl
        there:
        inc si
        loop small
        mov dl,13
        mov ah,2
        int 21h
        mov dl,10
        mov ah,2
        int 21h  
        mov dx,offset result
        mov ah,9
        int 21h
        mov dl,min
        mov ah,2
        int 21h
    
    main endp
end main
