.model small
.stack
.data 

msg db "Enter message: $"
msg2 db 10,13,"Encoded message: $"
msg3 db 10,13,"Message after being decoded:$"

str db 100 dup(?)
str_length db 0

table  db 65 dup (0) 
                                          
       db "TUVWXYZSRQPONABCDEFMLKJIHG$" 
       DB 5 dup(0)
       db "klmnoabcdezyxwfghijpqvutsr$"
       
       
new_table db 65 dup(0)
          db "NOPQRSZYXWVUTMLKJIHABCDEFG$" 
          db  5 dup(0)    
          db "fghijopqrsabcdetuzyxwvnmlk$"
          
               

.code
main proc
    
       mov ax,@data
       mov ds,ax 
       mov dx,offset msg
       mov ah,9
       int 21h
       ;mov dx,offset str_length
       xor bx,bx
       xor cx,cx
       mov bx,offset table    
       lea si,str
       
       mov ah,1   
       
       input:
       int 21h 
       cmp al,0dh
       je end_input
       xlat
       mov al,al
       mov [si],al
       inc si
       inc cx
       jmp input
       
       end_input:
       
       mov dx,offset msg2
       mov ah,9
       int 21h
       lea di,str
       
       xor bx,bx
       mov bx,cx
       
       output:
       mov dl,[di]
       mov ah,2
       int 21h
       inc di
       dec cx 
       jnz output
       
       mov dx,offset msg3
       mov ah,9
       int 21h 
       
       mov cx,bx
       xor bx,bx
       mov bx,offset new_table 
       lea di,str
       
       decrypted_output:
       mov al,[di]
       xlat
       mov dl,al
       mov ah,2
       int 21h    
       inc di
       loop decrypted_output
       
       
       
    
    main endp
end main
