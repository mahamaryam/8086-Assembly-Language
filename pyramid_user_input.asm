.model small
.stack
.data
msg db "Enter height of pyramid: $"    
star db 0
space db 0
.code
main proc
    
          mov ax,@data
          mov ds,ax
          mov dx,offset space     
          mov dx,offset msg
          mov ah,9
          int 21h
          mov ah,1
          int 21h
          sub al,48
          mov dx,offset star
          mov cl,al
          xor ax,ax
          mov dl,13
          mov ah,2
          int 21h
          mov dl,10
          mov ah,2
          int 21h
          mov space,cl
          mov bl,2
          mov dh,0
          mov ch,0
          
          outer:
          cmp cx,0
          je end
          push cx
          mov cl,space
          space_:
          mov dl,32
          mov ah,2
          int 21h
          dec cl
          jnz space_
          
          pop cx
          dec space
          
          push cx
          mov al,star
          mul bl
          aam
          inc al
          mov cl,al
          stars:
          mov dl,'*'
          mov ah,2
          int 21h
          dec cl
          jnz stars
          
          inc star
          pop cx
          mov dl,13
          mov ah,2
          int 21h
          mov dl,10
          mov ah,2
          
          int 21h 
          dec cx   
          
          jmp outer
          end:
          
          mov ah,4ch
          int 21h
              
    main endp
end main
