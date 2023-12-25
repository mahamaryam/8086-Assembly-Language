//compulsion to fill bx
.model small
.stack
.data
.code
main proc
      
      ;remaining four bits will have to be filled with garbage
      xor bx,bx
      mov ah,1
      l1:
      int 21h
      cmp al,0DH
      je end
      shl bx,1
      and al,0FH
      or bl,al 
      jmp l1
      end:
      
      xor dx,dx
      mov cx,3
      
      l2:
      rol bx,3
      mov dl,bl
      and dl,07H 
      add dl,48
      mov ah,2
      int 21h
     
      loop l2
    
    main endp
end main
