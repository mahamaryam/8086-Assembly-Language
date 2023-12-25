.model small
.stack
.data
.code
main proc
    
       xor bx,bx
       mov ah,1
       loop1:
       int 21h
       cmp al,0DH
       je end
       cmp al,57
       ja letter
       and al,0FH
       jmp there
       letter:
       sub al,55
       there:
       shl bx,4
       or bl,al
       jmp loop1
       
       end: 
       
       mov dl,13
       mov ah,2
       int 21h
       mov dl,10
       mov ah,2
       int 21h
       
       xor dx,dx
       mov ah,1
       loop2:
       int 21h
       cmp al,0DH
       je end_
       cmp al,57
       ja letter1
       and al,0FH
       jmp there2
       letter1:
       sub al,55
       there2:
       shl dx,4
       or dl,al
       jmp loop2
       
       end_:
       
       add bx,dx 
       
       jc one
       jmp where
       one:  
       MOV dl,13
       mov ah,2
       int 21h
       mov dl,10
       mov ah,2
       int 21h
       xor dx,dx
       mov dl,'1'
       mov ah,2
       int 21h 
       where: 
      
       mov cx,4
       loop3:
       rol bx,4
       mov dl,bl
       and dl,0FH
       cmp dl,9
       ja letter2
       add dl,30h
       jmp hh
       letter2:
       add dl,37h
       hh:
       mov ah,2
       int 21h    
       loop loop3      
                
    
    main endp
end main
