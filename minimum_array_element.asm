.model small
.stack 
.data     
min db ?
arr db 10 dup(?)
msg db "Enter Array: $"
msgmin db "Minimum element in array is $"
.code
main proc
    
     mov ax, @data
     mov ds,ax
     mov dx,offset msg
     mov ah,9
     int 21h
     lea si,arr
     mov cx,10
     entarr:
     mov ah,1
     int 21h
     mov [si],al
     inc si
     dec cx
     jnz entarr
     sub si,10
     mov dx,offset min
     mov al,[si]
     mov min,al
     mov cx,10
     
     cmploop:  
     mov bl,[si]
     cmp min,bl
     jb true
     
     mov min,bl
     
     true:
    
     inc si   
     dec cx
     jnz cmploop  
     
     mov dl,13
     mov ah,2
     int 21h
     mov dl,10
     mov ah,2
     int 21h
     mov dx,offset msgmin
     mov ah,9
     int 21h
     mov dl,min
     mov ah,2
     int 21h
     
    
    main endp
end main
