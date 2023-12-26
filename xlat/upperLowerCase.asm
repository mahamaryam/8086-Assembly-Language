.model small
.stack
.data
table db "abcdefghijklmnopqrstuvwxyz$" 
      db 5 dup(0)
      db "abcdefghijklmnopqrstuvwxyz$"
.code
main proc
        
        mov ax,@data
        mov ds,ax
        mov ah,1
        int 21h 
        sub al,65
        mov bx,offset table
        xlat
        mov dl,al
        mov ah,2
        int 21h
        
    
    
    main endp
end mainup
