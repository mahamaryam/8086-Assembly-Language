.model small
.stack
.data  
msg db "Enter a character: $"
msg2 db "Binary is $"
msg3 db "Number of 1's is $"  
var db 48
.code
main proc
        
        mov ax,@data
        mov ds,ax
        mov dx,offset msg
        mov ah,9
        int 21h
        
        mov ah,1
        int 21h
        mov bl,al
        lea dx,var
        mov dl,13
        mov ah,2
        int 21h
        mov dl,10
        mov ah,2
        int 21h
        mov dx,offset msg2
        mov ah,9
        int 21h
        mov cx,8
        loop1:
        shl bl,1
        jc set
        mov dl,'0'
        mov ah,2
        int 21h
        jmp exit
        set:
        inc var
        mov dl,49
        mov ah,2
        int 21h 
        
        exit:
        loop loop1
        mov dl,13
        mov ah,2
        int 21h
        mov dl,10
        mov ah,2
        int 21h
        mov dx,offset msg3
        mov ah,9
        int 21h 
  
        mov dl,var
       
        mov ah,2
        int 21h
    
    main endp
end main
