;check whether bl has a value greater than cl
.model small
.stack 100h
.data
msg1 db "Enter the first number(bl):$"
msg2 db "Enter the second number(cl):$"
msg3 db "Number is greater$"
msg4 db "Number is not greater$" 
msg5 db "Numbers are equal$"
.code
main proc
    
     mov ax,@data
     mov ds,ax
     mov dx,offset msg1
     mov ah,9
     int 21h
     mov ah,1
     int 21h
     mov bl, al    ;bl has our first number
     mov dl,13
     mov ah,2
     int 21h
     mov dl,10
     mov ah,2
     int 21h 
     mov dx,offset msg2
     mov ah,9
     int 21h
     mov ah,1
     int 21h
     mov cl, al    ;cl has our second number
     mov dl,13
     mov ah,2
     int 21h
     mov dl,10
     mov ah,2
     int 21h 
     cmp bl,cl
     je ab  ;check whether numbers are equal   
     ja aa    ;check whether bl has greater number or not
     ;if bl is not greater than cl
     mov dx,offset msg4 
     mov ah,9
     int 21h
     mov ah,4ch
     int 21h
     aa:
     mov dx,offset msg3 
     mov ah,9
     int 21h
     mov ah,4ch
     int 21h
     ab:
     mov dx,offset msg5
     mov ah,9
     int 21h
     mov ah,4ch
     int 21h
    
    
    main endp
end main
