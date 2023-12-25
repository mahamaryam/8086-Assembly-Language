.model small
.stack
.data
var1 db ?
var2 db ?
var3 db ?
msg db "Greatest of three is $"
.code
main proc
    
      mov ax,@data
      mov ds,ax
      mov dx,offset var1
     
      mov dx,offset var3
      mov ah,1
      int 21h
      mov var1,al
      mov ah,1
      int 21h
      mov cl,al
      mov ah,1
      int 21h
      mov var3,al
      
      cmp var1,cl
      ja true
      
       mov bl,cl
       jmp exit
      
      true:
      mov bl,var1
      exit:
      mov dx, offset msg
      mov ah,9
      int 21h
      cmp bl,var3
      ja true_
      mov dl,var3
      mov ah,2
      int 21h
      jmp endprogram
      true_:
      mov dl,bl
      mov ah,2
      int 21h
      endprogram:
    
    main endp
end main
