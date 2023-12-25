.model small
.stack
.data
arr db 10 dup(?)
msg db "Enter Array: $"
;missing element in a sorted array
notfound db "No element is missing! $"
found db "Element is $"
.code
main proc
      
      mov ax,@data
      mov ds,ax
      mov dx,offset msg
      mov ah,9
      int 21h
      mov dl,13
      mov ah,2
      int 21h
      mov dl,10
      mov ah,2
      int 21h
      lea si,arr
      mov cx,10
      loopx:
      mov ah,1
      int 21h
      mov [si],al
      inc si
      dec cx
      jnz loopx  
      
      sub si,10
      mov bl,'0'
      mov cx,10    
      mov al,[si]
      loop1:
      cmp bl,al
      je true
      
      mov dx,offset found
      mov ah,9
      int 21h
      mov dl,bl
      mov ah,2
      int 21h
      jmp exit
      
      true:
      dec cx
      inc si
      mov al,[si]
      inc bl
      jnz loop1 
      
      cmp bl,10
      je true2
      jmp exit
      
      true2:
      mov dx,offset notfound
      mov ah,9
      int 21h
      
      exit:
    
    main endp
end main
