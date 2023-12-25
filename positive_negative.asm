.model small
.stack
.data  
msg db "Enter an integer$"
msg1 db "Integer is positive$"
msg2 db "Integer is negative$"
.code
main proc
    
     mov ax,@data
     mov ds,ax
     mov dx, offset msg
     mov ah,9
     int 21h
     mov ah,2
     int 21h
     ;al has my int
     mov dl,13
     mov ah,2
     int 21h
     mov dl,10
     mov ah,2
     int 21h
     cmp al,0
     jg aa
     
     mov dx,offset msg2
     mov ah,9
     int 21h
     mov ah,4ch
     int 21h
     
     aa:
     mov dx,offset msg1
     mov ah,9
     int 21h
     mov ah,4ch
     int 21h
    
    
    main endp
end main
