.model small
.stack
.data   
msg db "Enter a string: $"
msg2 db "Reversed string: $"
.code
main proc
        
          mov ax,@data
          mov ds,ax 
          mov dx,offset msg
          mov ah,9
          int 21h
         
          xor ax,ax  
          mov cx,0
          mov ah,1
          input:
          int 21h
          cmp al,0DH
          je end
         
          inc cx
           push ax
          jmp input 
          
          end:
          
          mov dl,13
          mov ah,2
          int 21h
          mov dl,10
          mov ah,2
          int 21h
          
          mov dx,offset msg2
          mov ah,9
          int 21h
         
          output:
          pop ax
        
          mov dl,al
          mov ah,2
          int 21h
          
          loop output
    
    main endp
end main
