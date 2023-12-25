.model small
.stack
.data
msg db "Enter Number: $"
msg2 db 10,13,"Factorial is $"
.code
main proc
        
        mov ax,@data
        mov ds,ax
        mov dx,offset msg
        mov ah,9
        int 21h
        xor ax,ax
        mov ah,1
        int 21h
        sub al,48
        mov cl,al
        inc cl
        ;cl has loop counter
        mov al,1
        mov bl,1
        fac:
        mul bl
        aam
        inc bl
        cmp bl,cl
        je end
        jmp fac 
        end: 
       
        mov ch,ah
        mov cl,al
        mov dx,offset msg2
        mov ah,9
        int 21h
        mov dl,ch
        add dl,48
        mov ah,2
        int 21h
        mov dl,cl
        add dl,48
        mov ah,2
        int 21h
        
    main endp
end main
