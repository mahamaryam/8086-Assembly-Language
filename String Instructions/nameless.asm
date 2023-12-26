.model small
.stack
.data
str db 'DADdy',0
.code
main proc
    
      mov ax,@data
      mov ds,ax
      lea si,str 
      xor cl,cl
      aa:
      jmp now
      kk:
      dec cl
      now:
      lodsb
      inc cl
      cmp al,0
      je end
      cmp al,32
      je kk
     
      
      jmp aa
      
      end:
      mov dl,cl 
      DEC DL
      add dl,48
      mov ah,2
      int 21h
      
    
    main endp
end main
