.model small
.stack
.data
msg1 db "Number is even$"
msg2 db "Number is odd$"
.code
main proc
    
    mov ax,@data
    mov ds,ax
    mov ax,27
    mov bl,2
    div bl
    mov ch,ah 
    mov cl,al
    mov dl,ch 
    add dl,48
    mov ah,2
    int 21h ;rem
    mov dl,cl
    add dl,48
    mov ah,2
    int 21h ;quo 
    cmp ch,0
    je aa
    
     mov dx,offset msg2
     mov ah,9
     int 21h 
     mov ah,4ch
     int 21h
     
    aa:
    mov dx,offset msg1
    mov ah,9
    int 21h
    mov ah,4ch
    int 21h
    
    
    main endp
end main
