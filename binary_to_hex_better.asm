.model small
.stack
.data   
msg db "Enter Binary Value: $"
msg2 db "Hex Value is $"
.code
main proc
      
      mov ax,@data
      mov ds,ax
      mov dx,offset msg
      mov ah,9
      int 21h
      mov ah,1
      xor bx,bx
      
      while:
      int 21h
      cmp al,0DH
      je end 
      and al,0FH
      shl bx,1  
      or bl,al
      jmp while
      
      end:
      ;now bx has my binary number
      mov dl,13
      mov ah,2
      int 21h
      mov dl,10
      mov ah,2
      int 21h
      xor dl,dl
      mov dx,offset msg2
      mov ah,9
      int 21h
      
      mov cx,4
      
      loop1:
      rol bx,4
      mov dl,bl
      and dl,0FH 
      cmp dl,9
      jle aa
      add dl,55
      mov ah,2
      int 21h
      jmp exit2
      aa:
      add dl,48
      mov ah,2
      int 21h  
      exit2:
      loop loop1
      
    main endp
end main
