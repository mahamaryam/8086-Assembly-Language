;hex input binary output
;hex!=4 digits then error
.model small
.stack
.data
msg db "Enter Hexadecimal Number: $"
error db "Error! Re-enter: $"
msg2 db "Binary: $"
.code
main proc
    
      mov ax,@data
      mov ds,ax
      lea dx,msg
      mov ah,9
      int 21h 
      tohere:
      mov cx,0
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
      cmp cx, 5
      jb eror  
      jmp ok
      eror:
      mov dl,13
      mov ah,2
      int 21h
      mov dl,10
      mov ah,2
      int 21h
      mov dx,offset error
      mov ah,9
      int 21h
      jmp tohere   
      
      ok: 
      mov dl,13
      mov ah,2
      int 21h
      mov dl,10
      mov ah,2
      int 21h
      mov dx,offset msg2
      mov ah,9
      int 21h
      mov cx,16
      loop5:
      shl bx,1
      jc one
      mov dl,48
      mov ah,2
      int 21h
      jmp idhr
      one:
      mov dl,49
      mov ah,2
      int 21h 
      idhr:
      loop loop5
    
    main endp
end main
