;print all even numbers from an array
.model small
.stack 100h
.data
arr db 10 dup(?)
msg db "Enter array:$"
msg2 db "Even Numbers in Array:$"
.code
main proc
    
      mov ax,@data
      mov ds,ax
      mov si,offset arr
      mov dx,offset msg
      mov ah,9
      int 21h
      mov cx,10
      l1:
      mov ah,1
      int 21h
      mov [si],al
      inc si
      dec cx
      jnz l1  
                                              
      mov dl,13
      mov ah,2
      int 21h
      mov dl,10
      mov ah,2
      int 21h
      
      sub si,10 
      mov cx,10
      loopx:
      mov ax,[si]
      mov bl,2
      div bl
      mov cl,al ;quotient
      mov ch,ah ;rem
      cmp ch,0
      je true
      
      inc si
      dec cx
      jmp go
      
      true:
      mov dl,[si]
      mov ah,2
      int 21h
      inc si
      dec cx
      go:
      jnz loopx
    
    main endp
end main
