.model small
.stack
.data
.code
main proc
    
        xor bx,bx
        mov cx,0
        mov ah,1
       
        
        for:
        int 21h
        cmp al,0Dh
        je end
        and al,0FH
        inc cx
       
        shl bx,1
        or bl,al
        je end 
        jmp for
        end:
           
        mov dl,'a'
        mov ah,2
        int 21h
        
        loop1:
        shl bx,1
        jc one
        
        mov dl,48
        mov ah,2
        int 21h
        jmp start
        
        one:
        mov dl,'1'
        mov ah,2
        int 21h
        start:
        
        loop loop1
        
    main endp
end main
