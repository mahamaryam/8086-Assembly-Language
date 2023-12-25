.model small
.stack
.data
str db "ThiS Is A cOmPUteR$"
.code
main proc
    
        mov ax,@data
        mov ds,ax
        lea bx,str
        mov cx,18
        loop1:
        mov dl,[bx]
        inc bx
        xor dl,20h
        mov ah,2
        int 21h
        loop loop1
    
    main endp
end main
