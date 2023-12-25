.model small
.stack 
.data
msg0 db "Enter number 1:$"
msg01 db "Enter number 2:$"
msg1 db "Numbers are equal$"
msg2 db "Numbers are not equal$"
main proc
       
     mov ax,@data
     mov ds,ax
     mov dx,offset msg0
     mov ah,9
     int 21h
     mov ah,1
     int 21h
     mov bl,al  ;bl has number 1 entered first
     mov dl,13 
     mov ah,2
     int 21h
     mov dl,10
     mov ah,2
     int 21h 
     mov dx,offset msg01
     mov ah,9
     int 21h 
     mov ah,1
     int 21h
     mov cl,al    ;al has the second number 
     cmp bl,cl
     je aa
      mov dl,13 
     mov ah,2
     int 21h
     mov dl,10
     mov ah,2
     int 21h 
     mov dx,offset msg2
     mov ah,9
     int 21h
     mov ah,4ch
     int 21h
     aa:  
      mov dl,13 
     mov ah,2
     int 21h
     mov dl,10
     mov ah,2
     int 21h 
     mov dx,offset msg1
     mov ah,9
     int 21h
       
    
    main endp
end main
