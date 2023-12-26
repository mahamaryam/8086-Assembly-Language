.model small
.stack
.data             
msg db 10,13,"Enter string: $"
cor db 10,13,"Correctly bracketed!$"
wro db 10,13,"Incorrectly bracketed!$" 
ask db 10,13,"Do you want to continue?(Y/N)$"
term db 10,13,"Program Terminated!$" 
var db 0
.code
main proc
    
        start: 
        xor bx,bx
        mov ax,@data
        mov ds,ax
        mov dx,offset msg
        mov ah,9
        int 21h          
        
        input:
         mov ah,1
        int 21h
        cmp al,0DH
        je end
        cmp al,40
        je pushr
        cmp al,91
        je pushsq
        cmp al,123
        je pushr
        cmp al,41
        je popr
        cmp al,93
        je popsq
        cmp al,125
        je popfl  
        jmp continue
        pushr:
        inc var
        mov bl,al
        and bx,0FH
        push bx
        jmp continue 
        pushsq:
        inc var
        dec al
        mov bl,al
        ;backend Z
        and bx,0FH
        push bx
        jmp continue
        popr:  
        dec var
        pop bx
        dec al
          
        and ax,0FH
        
        cmp bx,ax
        je continue
        jmp bye  
        popsq: 
        dec var
        pop bx  
        dec al
        dec al 
        dec al
       
        mov cl,al
        and cx,0FH
        cmp bx,cx
        je continue
        jmp bye 
        popfl: 
        dec var
        pop bx   
        dec al
        dec al  
      
        and ax,0FH(
        cmp bx,ax
        je continue
        jmp bye
        
        continue:
        jmp input
        end:   
        cmp var,0
        jne bye               
           
        mov dx,offset cor
        mov ah,9
        int 21h
        jmp xx   
        
        bye:
        mov dx,offset wro
        mov ah,9
        int 21h
        xx:
          mov dx,offset ask
          mov ah,9
          int 21h
          mov ah,1
          int 21h
          cmp al,'Y'
          je yes   
          jmp xyz
          yes:
          jmp start
          xyz:
          mov dx,offset term 
          mov ah,9
          int 21h
          mov ah,4ch
          int 21h
      
        
    
    main endp
end main
