.model small
.stack
.data
.code
main proc
      
      mov ax,1234H
      ;ax = 4321
      xchg al,ah
      ;ax = 2143
      rol ah,4
      rol al,4
      mov bx,ax
      mov cx,4
      for:
      
      mov cx,4
      output:
     
      mov al,bh
      and al,0F0H
      shr al,4
      cmp al,9
      jbe number
      add al,37h
      jmp here
      number:
      add al,30h
      here:
      mov dl,al
      mov ah,2
      int 21h 
      rol bx,4
      loop output
      
    main endp
end main
