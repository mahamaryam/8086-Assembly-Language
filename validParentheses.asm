.model small
.stack
.data             
msg db "Enter string: $"
cor db 10,13,"Correctly bracketed!$"
wro db 10,13,"Incorrectly bracketed!$"
.code
main proc
    
        ;push all encountered brackets in order...
        ;if a right bracket is encountered, push bx from 
        ;stack and compare bx-> bl with al. if they are same
        ;then continue, else terminate the program 
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
        
        mov bl,al
        and bx,0FH
        push bx
        jmp continue 
        pushsq:
        
        dec al
        mov bl,al
        ;backend Z
        and bx,0FH
        push bx
        jmp continue
        popr:
        pop bx
        dec al
          
        and ax,0FH
        
        cmp bx,ax
        je continue
        jmp bye  
        popsq:
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
           
        mov dx,offset cor
        mov ah,9
        int 21h
        jmp xx   
        
        bye:
        mov dx,offset wro
        mov ah,9
        int 21h
        xx:
          mov ah,4ch
        int 21h
      
        
    
    main endp
end main
