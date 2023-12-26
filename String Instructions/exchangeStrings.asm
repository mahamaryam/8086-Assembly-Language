.model small
.stack
.data
str db "House"
str2 db "Plate"
db 5 dup(5)
.code
main proc
    
        mov ax,@data
        mov ds,ax
        mov es,ax
        lea di,str2+5
        lea si,str
        mov cx,5
        rep movsb
        
        lea di,str
        lea si,str2
        mov cx,5
        rep movsb
        
        lea di,str2
        lea si,str2+5
        mov cx,5
        rep movsb
        
        mov cx,5
        lea si,str2
        output:
        mov dl,[si]
        mov ah,2
        int 21h
        inc si
        loop output        
                   
    main endp
end main
