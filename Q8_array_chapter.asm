.model small
.stack
.data
arr db 100 dup(?)
.code
main proc
    
        mov ax,@data
        mov ds,ax 
        lea si,arr  
        lea di,arr
        mov cx,100
        xor bx,bx
        loop1:
        mov dl,'?'
        mov ah,2
        int 21h
        mov ah,1
        int 21h
        cmp al,27
        je end
        mov [si],al
        inc si
        inc bx
        push cx
        mov cx,bx
        mov dl,13
        mov ah,2
        int 21h
        mov dl,10
        mov ah,2
        int 21h
        show:  
        mov dl,[di]
        mov ah,2
        int 21h
        inc di 
        loop show
        mov dl,13
        mov ah,2
        int 21h
        mov dl,10
        mov ah,2
        int 21h
        pop cx
        mov di,0
        loop loop1
        
        end:
        mov ah,4ch
        int 21h
    
    
    main endp
end main
