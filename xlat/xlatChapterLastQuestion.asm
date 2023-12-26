.model small
.stack
.data
table db 47 dup(0)
      db "0123456789$"
      db 7 dup(0)
      db "ABCDEF$"
.code
main proc
    
        mov ax,@data
        mov ds,ax  
        xor bx,bx
        mov cx,4   
        mov ah,1 
        
        input:
        int 21h
        cmp al,'A'
        jae letter
        sub al,30h
        jmp here
        letter:
        sub al,37h
        here:
        shl bx,4
        or bl,al
        dec cx
        jnz input
        
        ;hex input complete
        
        mov dl,13
        mov ah,2
        int 21h
        mov dl,10
        mov ah,2
        int 21h
        
        xor dx,dx
        mov dx,bx
        mov bx,offset table
        mov cx,4
        
        output:
        mov al,dh
        and al,0F0H
        sHr al,4
        rol dx,4
        cmp al,9
        jbe number
        add al,37h
        jmp there
        number:
        add al,30h  
         there:
        xlat 
        mov dl,al
        mov ah,2
        int 21h
        dec cx
        jnz output
        
    
    main endp
end main
      
