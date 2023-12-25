.model small
.stack
.data   
var db 0
.code
main proc
        
        mov ax,@data
        mov ds,ax 
        
        lea dx,var
        
        xor bx,bx
        mov cx,0
        mov ah,1
        
        start:
        int 21h
        cmp al,0DH
        je end
        and al,0FH
        shl bx,1
        or bl,al
        jmp start
        
        end:
        
        mov dl,13
        mov ah,2
        int 21h
        mov dl,10
        mov ah,2
        int 21h
        
        mov cx,4
        
        outer:
        push cx
        mov cx,0
        
        inner:
        ok:  
        cmp cx,4
        je exitin
        inc cx
        shl bx,1 
       
         
        
       
        jc yes
        jmp ok
        
        yes:
        cmp cx,1
        je eight
        cmp cx,2
        je four
        cmp cx,3
        je two 
        cmp cx,4 
        je one
        eight:
        add var,8
        jmp ok
        four:
        add var,4
        jmp ok
        two:
        add var,2  
        jmp ok
        one:
        add var,1
        jmp ok
       
        jmp inner
        
        exitin: 
        pop cx
        add var,48
        mov dl,var
        mov ah,2
        int 21h
        mov var,0
        dec cx
        jnz outer
        
        
    main endp
end main
