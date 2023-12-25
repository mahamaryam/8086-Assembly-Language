.model small
.stack
.data   
sum db 0
.code
main proc
        
        mov ax,@data
        mov ds,ax
        mov dx,offset sum
        mov al,30
        mov ah,0
        mov dh,al
        mov bl,2
        div bl
           
        ;dh has my original number and bh has rem
        mov cl,al
        mov ch,0
        loopy:
        mov ah,0
        mov al,dh
       
        mov bl,cl
        div bl
        cmp ah,0
        je insum
        
        jmp end
        insum:
        add sum, cl
        end:
        
        loop loopy
        
        cmp sum,dh
        je perfect
        mov dl,'n'
        jmp there
        perfect:
        mov dl,'p'
        there:
        mov ah,2
        int 21h
        
    
    main endp
end main
