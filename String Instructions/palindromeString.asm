.model small
.stack
.data   
arr db 20 dup(?)
arr2 db 20 dup(?)
.code
main proc
        
        mov ax,@data
        mov ds,ax
        mov es,ax
        lea di,arr
        mov cx,0
        input: 
        
        mov ah,1
        int 21h
        cmp al,0DH
        je end
        cmp al,','
        je input  
        cmp al,32
        je input
        cmp al,"'"
        je input
        stosb
        inc cx
        jmp input
        end:    
        lea si,arr
        push dx
        push ax 
        mov dl,13
        mov ah,2
        int 21h
        mov dl,10
        mov ah,2
        int 21h
        pop ax
        pop dx
        push cx
        forward:
        mov dl,[si]
        mov ah,2
        int 21h
        inc si
        loop forward
        pop cx
        push cx 
        push dx
        push ax
        mov si,offset arr 
        dec cx
        add si,cx
        mov dl,13
        mov ah,2
        int 21h
        mov dl,10
        mov ah,2
        int 21h
        inc cx
        std
        back:
        lodsb
        mov dl,al
        mov ah,2
        int 21h
        loop back
        
        pop ax
        pop dx
        pop cx     
        
        mov di,offset arr2
        lea si,offset arr
        add si,cx       
        dec si
        aa:
        movsb
        add di,2
        loop aa
        
        mov 
        
    main endp
end main
