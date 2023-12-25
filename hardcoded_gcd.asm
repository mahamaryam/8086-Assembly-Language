.model small
.stack
.data
.code
main proc  
    
        xor bx,bx
        xor cx,cx
        xor ax,ax
        xor dx,dx
        mov dl,40
        mov dh,25
        mov al,dh
        mov bl,2
        div bl
        ;al has quot
        mov cl,al
        loopa:  
        mov ah,0
        mov al,dl
        mov bl,cl
        div bl
        mov bh,al
        cmp ah,0
        je fine
        jmp end
        fine:    
        mov ah,0
        
        mov al,dh
        mov bl,cl
        div bl
        cmp ah,0
        je ok
        jmp end
        ok:
        mov dl,cl
        add dl,48
        mov ah,2
        int 21h
        mov ah,4ch
        int 21h
        
        jmp end
        end:
        dec cl
        jnz loopa
       
    
    main endp
end main
