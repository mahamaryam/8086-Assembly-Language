.model small
.stack
.data        
var db 0
.code
main proc
      
      mov ax,@data
      mov ds,ax
      mov dx,offset var
      xor bx,bx
      mov ah,1
      loop1:
      int 21h
      inc cx
      cmp al,0DH
      je end
      cmp al,57
      ja letter
      and al,0FH
      jmp here
      letter:
      sub al,55
      here:
      shl bx,4
      or bl,al
      jmp loop1 
      end:
      ;hex input complete
      ;in the backend its already stored as binary
      shl bx,1
      jc one
      mov dl,48
      jmp hh
      one:
      mov dl,49
      hh:
      mov ah,2
      int 21h
      mov cx,5
      loop2:
      rol bx,3
      mov dl,bl
      and dl,07h
      add dl,48
      mov ah,2
      int 21h
      loop loop2
    
    main endp
end main
