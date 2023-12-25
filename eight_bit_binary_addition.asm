.model small
.stack
.data
.code
main proc
        
        xor bl,bl
        mov ah,1
        loop1:
        int 21h
        cmp al,0DH
        je end
        and al,0FH 
        shl bl,1
        or bl,al
        jmp loop1 
        
        end:  
        mov dl,13
        mov ah,2
        int 21h
        mov dl,10
        mov ah,2
        int 21h
        xor dl,dl
        mov ah,1
        loop2:
        int 21h
        cmp al,0DH
        je end2
        and al,0FH 
        shl dl,1
        or dl,al
        jmp loop2
        end2:
        
        add bl,dl 
        mov dl,13
        mov ah,2
        int 21h
        mov dl,10
        mov ah,2
        int 21h
        jc one
        jmp print
        one:
        mov dl,'1'
        mov ah,2
        int 21h
        print:   
        mov cx,8
        loop3:
        shl bl,1
        jc one_
        mov dl,'0'
        jmp here
        one_:
        mov dl,'1'
        here:
        mov ah,2
        int 21h 
        loop loop3
        
    
    main endp
end main
