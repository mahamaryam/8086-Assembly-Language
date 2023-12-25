.model small
.stack
.data   
odd db "letter is lowercase$"   
even db "letter is uppercase $"
.code
main proc
    
    mov ax,@data
    mov ds,ax  
    mov ah,1
    int 21h  
    mov bl,al 
    test al,20h
    mov dl,13
    mov ah,2
    int 21h
    mov dl,10
    mov ah,2
    int 21h
    jz true
    mov dx,offset odd
    mov ah,9
    int 21h
    jmp end
    
    true:
    mov dx,offset even
    mov ah,9
    int 21h
    end:
    mov ah,4ch
    int 21h
    
    main endp
end main
