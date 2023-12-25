.model small
.stack
.data
msg db "Enter Binary Value: $"
msg2 db "Hexadecimal Value: $"
error db "Error! Re-enter: $"
.code
main proc
    
       mov ax,@data
       mov ds,ax
       mov dx,offset msg
       mov ah,9
       int 21h
       here: 
       xor bx,bx
       mov ah,1
       loop1:
       int 21h
       cmp al,0DH
       je end
       cmp al,'1'
       ja eror
       shl bx,1
       and al,0FH
       or bl,al
       jmp loop1
       end:
       
       mov dl,13
       mov ah,2
       int 21h
       mov dl,10
       mov ah,2
       int 21h
       
       mov dx,offset msg2
       mov ah,9
       int 21h  
       
       mov cx,4
       
       print:
       rol bx,4
       mov dl,bl
       and dl,0FH
       cmp dl,9
       jle aa
       add dl,55
       jmp ab
       aa:
       add dl,48
       ab:
       mov ah,2
       int 21h
       dec cx
       jnz print 
       mov ah,4ch
       int 21h
        
       eror:
       mov dl,13
       mov ah,2
       int 21h
       mov dl,10
       mov ah,2
       int 21h
       mov dx,offset error
       mov ah,9
       int 21h
       jmp here
    
    main endp
end main
