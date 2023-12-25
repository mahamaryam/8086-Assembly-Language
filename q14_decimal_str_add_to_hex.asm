.model small
.stack
.data  
var db 0
.code
main proc
    
        mov ax,@data
        mov ds,ax
        mov dx,offset var
        mov ah,1
        input:
        int 21h
        cmp al,0DH
        je end
        add var,al
        sub var,48
        jmp input
        end:  
        
        xor bl,bl
        mov bl,var     
        mov dl,13
        mov ah,2
        int 21h
        mov dl,10
        mov ah,2
        int 21h
        mov cx,2
        loop2:
        rol bl,4
        mov dl,bl
        and dl,0FH  
        cmp dl,9
        ja letter
        add dl,48
        jmp idhr
        letter:
        add dl,55
        idhr:
        mov ah,2
        int 21h
        loop loop2
    
    main endp
end main
