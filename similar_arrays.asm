.model small
.stack 
.data
arr1 db 5 dup(?)
arr2 db 5 dup(?)
msg1 db "Enter first array:$"
msg2 db "Enter second array:$" 
unequal db "Arrays are not equal$" 
equal db "Arrays are equal$"
.code
main proc
    
     mov ax,@data
     mov ds,ax
     lea dx,msg1
     mov ah,9
     int 21h
     lea si,arr1  
     lea di,arr2
     mov cx,5
     firstarr:
     mov ah,1
     int 21h
     mov [si],al
     inc si
     dec cx
     jnz firstarr
     mov dl,13
     mov ah,2
     int 21h
     mov dl,10
     mov ah,2
     int 21h
     mov dx,offset msg2
     mov ah,9
     int 21h
     mov cx,5
     secondarr:
     mov ah,1
     int 21h
     mov [di],al
     inc di
     dec cx
     jnz secondarr     
     mov dl,13
     mov ah,2
     int 21h
     mov dl,10
     mov ah,2
     int 21h
     
    ; both of the arrays have been entered
     
     
     sub di,5
     sub si,5
     mov cx,5
     loopx:
     mov bl,[si]
     mov dl,[di]
     cmp bl,dl
     je ok 
     
        lea dx,unequal
        mov ah,9
        int 21h 
        mov ah,4ch
        int 21h
        
     
     ok:
     inc di
     inc si
     dec cx
     jnz loopx 
     
     mov dx,offset equal
     mov ah,9
     int 21h
        
    main endp
end main
