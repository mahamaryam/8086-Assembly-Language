.model small
.stack
.data
arr db 10 dup(?)         
msg2 db "Maximum element of array is $"
msg db "Enter array: $"  
max db ?
.code
main proc
    
      mov ax,@data
      mov ds,ax
      mov dx,offset msg
      mov ah,9
      int 21h
      mov si,offset arr
      mov cx,10
      entloop:
      mov ah,1
      int 21h
      mov [si],al
      inc si
      dec cx
      jnz entloop
      mov dl,13
      mov ah,2
      int 21h
      mov dl,10
      mov ah,2
      int 21h 
      lea dx,max
      sub si,10
      mov bl,[si]
      mov max,bl
      ;max has the first element of the array
      mov cx,10
        
      maxloop:
      mov al,[si]
      cmp max,al
      ja true
      
      mov max,al
      
      true:
     
      inc si 
      
      loop maxloop
      
      mov dx,offset msg2
      mov ah,9
      int 21h
      mov dl,max
      mov ah,2
      int 21h
      
    main endp
end main
