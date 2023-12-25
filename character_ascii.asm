.model small
.stack
.data
msg db "Enter a character: $"
msg2 db "ASCII code is: $"
cont db "Continue? (Y/N) $"
term db "Program Terminated! $"
.code
main proc
    
      mov ax,@data
      mov ds,ax
       
      start:
      mov dx,offset msg
      mov ah,9
      int 21h 
      mov ah,1 
      int 21h
      xor bl,bl
      mov bl,al
       mov cx,2
       mov dl,13
       mov ah,2
       int 21h
       mov dl,10
       mov ah,2
       int 21h
       mov dx,offset msg2
       mov ah,9
       int 21h
       
      loop1:
      rol bl,4
      mov dl,bl
      and dl,0FH
      cmp dl,9
      jle aa
      add dl,37h
      jmp here
      aa:
      add dl,30h
      here:
      mov ah,2
      int 21h
      dec cx
      jnz loop1
      
      mov dl,13
      mov ah,2
      int 21h
      mov dl,10
      mov ah,2
      int 21h
      
      lea dx,cont
      mov ah,9
      int 21h
      mov ah,1
      int 21h
      cmp al,'Y'
      je continue
      jmp end
      continue:
      mov dl,13
      mov ah,2
      int 21h
      mov dl,10
      mov ah,2
      int 21h
      jmp start
      
      end:
      mov dl,13
      mov ah,2
      int 21h
      mov dl,10
      mov ah,2
      int 21h
      mov dx,offset term
      mov ah,9
      int 21h
      mov ah,4ch
      int 21h
      
      
       
        
    main endp
end main
