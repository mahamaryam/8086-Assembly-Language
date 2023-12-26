.model small
.stack
.data
even db "Number is even! $"
odd db "Number is odd!$"
.code           
main proc
        
      mov ax,@data
      mov ds,ax
      mov ah,1    
      
      loop1:
      int 21h
      cmp al,0DH
      je end  
      mov bl,al
      jmp loop1
      end:
        shr bl,1
        jnc true
        mov dx,offset odd
        jmp here
        true:
        mov dx,offset even
        here:
        mov ah,9
        int 21h
        mov ah,4ch
        int 21h
    
    main endp
end main
