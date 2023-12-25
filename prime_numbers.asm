.model small
.stack
.data   
flag db 0    
.code
main proc        
    
         mov ax,@data
         mov ds,ax
         mov dx,offset flag 
         
         mov cx,2 
        
         input:
          mov ah,1
         int 21h
         and al,0FH
         shl bx,4
         or bl,al
         loop input 
         
         
         mov al,bl
           xor cx,cx
           mov ah,0
             
         mov bl,2
         mov ch,al
         div bl
         ;ah has rem and al has quot
         mov cl,al
         loopy: 
         cmp cl,1
         je end 
         mov ah,0
         mov al,ch         
         mov bl,cl
         div bl
         cmp ah,0
         je set
         jmp ok
         set:
         mov flag,1
         ok:
         
         dec cl
         jnz loopy
         end:
         cmp flag,1
         je no
         mov dl,'p'
         jmp here
         no:
         mov dl,'n'
         here:
         mov ah,2
         int 21h
        
    main endp
end main
