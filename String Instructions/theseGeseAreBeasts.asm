.model small
.stack
.data
str db 'TH*S* G*S* AR* B*ASTS',0
.code
main proc
    
       mov ax,@data
       mov ds,ax
       mov es,ax
       lea di,str
       mov al,'E'
       cld 
       mov cx,0
       aa:  
       cmp [di],0
       je end
       cmp [di],'*'
       je ok
       jmp enedd
       ok:
       inc cx
       stosb
       jmp aa 
       enedd:
       inc di
       inc cx
       jmp aa
       end:  
       lea si,str
       yout:
       mov dl,[si]
       mov ah,2
       int 21h
       inc si
       loop yout
    
    main endp
end main
