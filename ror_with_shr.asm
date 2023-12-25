.model small
.stack
.data
.code
main proc
        
        mov al,0CAH
        mov cx,3 
        
        loop1:
        shr al,1
        jc one
        OR al,00H
        jmp there
        one:
        or al,80H
        there:
        dec cx
        jnz loop1
        mov bl,al
        mov cx,8
        print:
        shl bl,1
        jc onep
        mov dl,'0'
        jmp ok
        onep:
        mov dl,'1'
        ok:
        mov ah,2
        int 21h
        loop print
        
    main endp
end main
