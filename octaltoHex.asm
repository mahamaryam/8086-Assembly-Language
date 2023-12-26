.model small
.stack             
.data  
msg db "Enter 4-Digit Octal Number: $"
msg2 db "Hexadecimal equivalent is $"
errormsg db "Incorrect! Re-enter: $"            
count db 0
var db 0
.code
main proc
        
        mov ax,@data
        mov ds,ax
        mov dx,offset count
        mov dx,offset var
       
       mov dx,offset msg
       mov ah,9
       int 21h 
       error:
       xor bx,bx
       mov cx,0  
       mov ah,1  
      
      loop1:
      int 21h
      inc cx
      cmp al,0DH
      je end
      cmp al,57
      ja letter
      and al,0FH
      jmp heree
      letter:
      sub al,55
      heree:
      shl bx,4
      or bl,al
      jmp loop1
      
      
      end:
      cmp cx,5
      je forward
      mov dl,13
      mov ah,2
      int 21h
      mov dl,10
      mov ah,2
      int 21h
      mov dx,offset errormsg
      mov ah,9
      int 21h
      jmp error     
      ;bx contains hex
        forward:
        mov dl,13
        mov ah,2
        int 21h
        mov dl,10
        mov ah,2
        int 21h
        mov dx,offset msg2
        mov ah,9
        int 21h
        xor ax,ax
        mov cx,12
        here:
        inc var
        shl bx,1
        mov count,0
        cmp var,5
        je endloop
        
        l1:
        shl bx,1
        jc one
        
        mov dl,'0'
        and dl,0FH
        shl ax,1
        or al,dl
        inc count
        jmp idhr
        one: 
        mov dl,'1'
        and dl,0FH
        shl ax,1
        or al,dl
        inc count
        idhr:
        cmp count,3
        je here
        dec cx
        jnz l1 
        
        endloop:
        
        
        xor bx,bx
        mov bx,ax
       
        rol bx,4
        mov cx,3  
        
        print:
        rol bx,4
        mov dl,bl
        and dl,0FH
        cmp dl,9
        ja letter2
        add dl,30h
        jmp ok
        letter2:
        add dl,37h
        ok:
        mov ah,2
        int 21h
        loop print
        
    
    main endp
end main
