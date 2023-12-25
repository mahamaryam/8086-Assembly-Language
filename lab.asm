.model small
.stack
.data   
msg db 0ah,0Dh,"Enter the Year: $"
number db 6,0,6, dup("$" )
leap db 10,13,"Yes, it is a leap year!$"
noleap db 10,13,"No, it is not a leap year$"
.code
main proc
    
      mov ax,@data
      mov ds,ax
      lea dx,msg
      mov ah,9
      int 21h
      lea dx,number
      mov ah,0ah
      int 21h 
      lea bx,number+4    ;limit of input
      mov ah,[bx]
      mov al,[bx+1]     
      aad            
      ;ax has dividend
      mov bl,4
      div bl
      cmp ah,0
      je isleap
      mov dx,offset noleap
      mov ah,9
      int 21h
      jmp end
      
      isleap:
      mov dx,offset leap
      mov ah,9
      int 21h
      end:
      mov ah,4ch
      int 21h 
      
    
    main endp
end main
