.model small
.stack
.data
arr db 09h,10h,22h,13h,0A5h
.code
main proc
    
        mov ax,@data
        mov ds,ax
        lea si,arr
        call SUM  
        call display 
        MOV ah,4ch
        int 21h
        
    
    main endp      

SUM proc
    
    xor bx,bx
    mov cx,5   
    
    sumloop:
    add bl,[si]
    inc si
    dec cx
    jnz sumloop
    
 ret
 SUM endp 

display proc
    
        mov cx,2
       loop3:
       rol bl,4
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
    
    ret
  display endp       
