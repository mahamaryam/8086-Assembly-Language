.model small
.stack
.data   
arr1 db 7 dup(?)
arr2 db 7 dup(?)
msg db "Enter first Array: $"
msg2 db "Enter second Array: $"
equal db "Arrays are Equal!$"  
count dw '0'
notequal db "Arrays are not Equal!$"
.code
main proc
    
         mov ax,@data
         mov ds,ax
         mov dx,offset msg
         mov ah,9
         int 21h
         mov cx,7
         lea si,arr1
         lea di,arr2
         ar1:
         mov ah,1
         int 21h
         mov [si],al
         inc si
         dec cx
         jnz ar1
         mov dl,13
         mov ah,2
         int 21h
         mov dl,10
         mov ah,2
         int 21h
         mov dx,offset msg2 
         mov ah,9
         int 21h
         mov cx,7
         ar2:
         mov ah,1
         int 21h
         mov [di],al
         inc di
         dec cx
         jnz ar2
         mov dl,13
         mov ah,2
         int 21h
         mov dl,10
         mov ah,2
         int 21h
         sub si,7
         sub di,7
         mov ax,0
         mov cx,7  
         mov dx,offset count
         outer:
         push cx
         mov cx,7
         mov bl,[si]
         inner:
       
         cmp bl,[di]
         je ok
         jmp continue
         
         ok:
         mov [di],'a'
         jmp exit
         
         continue:
         inc di
         inc ax
         loop inner 
         
         exit:
      
         ;dec cx
         sub di,ax
         mov ax,0
         inc si
            pop cx
         loop outer     
         
         mov dl,13
         mov ah,2
         int 21h
         mov dl,10
         mov ah,2
         int 21h
         mov cx,7
         lea di,arr2  
         
 ;        print:
  ;       mov dl,[di]
   ;      mov ah,2
    ;     int 21h 
     ;    inc di
      ;   loop print 
         
      ;   mov ah,4ch
       ;  int 21h
         
         compare:
         cmp [di],'a'
         jne iftrue
         
         jmp con
         
         iftrue:
         mov dx,offset notequal
         mov ah,9
         int 21h
         mov ah,4ch
         int 21h
         
         con:  
         inc di
         loop compare
         
         mov dx,offset equal
         mov ah,9
         int 21h
         mov ah,4ch
         int 21h
         
         
     
    
        main endp
end main
