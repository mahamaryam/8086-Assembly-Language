.model small
.stack
.data   
correct db "Correctly bracketed!$"
incorrect db "Incorrectly bracketed!$"
.code
main proc
        
        mov ax,@data
        mov ds,ax
       
        input:
        xor ax,ax  
         mov ah,1
        int 21h
        cmp al,0DH
        je final
        cmp al, 40
        je on_stack
        cmp al,91
        je on_stack
        cmp al,123
        je on_stack
        cmp al,41
        je pop_from_stack
        cmp al,93
        je pop_from_stack2
        cmp al,125
        je pop_from_stack2 
        jmp input
        on_stack:
        push ax 
        jmp input
        pop_from_stack:
        mov bl,al
        pop ax
        dec bl
        cmp bl,al
        je input 
        jmp end
        pop_from_stack2:
        mov bl,al
        pop ax
        sub bl,2
        cmp bl,al
        je input
        jmp end
        
        final:
        mov dx,offset correct
        mov ah,9
        int 21h
        jmp last
        
        end:
        mov dx,offset incorrect
        mov ah,9
        int 21h
        
        last:
        mov ah,4ch
        int 21h
    
    main endp
end main
