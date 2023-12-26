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
      mov cx,12
      here3:
      shl bx,1
      mov var,0
      l1: 
      cmp var,3
      je here3
      shl bx,1
      inc var
      jc one
      mov dl,'0'
      jmp here2
      one:
      mov dl,'1'
      here2:
      mov ah,2
      int 21h
      loop l1
    
    main endp
end main
