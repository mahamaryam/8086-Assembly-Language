.model small
.stack
.data 
p db 10,13,"Palindrome Number!$"
np db 10,13,"Not a Palindrome Number!$"
.code
main proc
      
      mov ax,@data
      mov ds,ax
      mov cx,4
      xor bx,bx
      input:
      mov ah,1
      int 21h
      cmp al,'9'
      ja letter
      sub al,30h
      jmp there
      letter:
      sub al,37h
      there:
      shl bx,4
      or bl,al
      dec cx
      jnz input
      
      mov cx,bx
      
      xchg bl,bh
      rol bh,4
      rol bl,4 
      
      cmp bx,cx
      je palindrome  
      mov dx,offset np
      jmp here 
      
      palindrome:
      mov dx,offset p 
      here:
      mov ah,9
      int 21h
      mov ah,4ch
      int 21h
      
      
      
    main endp
end main
