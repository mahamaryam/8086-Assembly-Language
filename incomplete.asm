.model small
.stack
.data
arr1 db 10 dup(?)
arr2 db 10 dup(?)
msg db "Enter Array: $"   
msg2 db "Second Array$" 
var db '0'
.code
main proc
    
     mov ax,@data
     mov ds,ax
     mov dx,offset msg
     mov ah,9
     int 21h
     mov dl,13
     mov ah,2
     int 21h
     mov dl,10
     mov ah,2
     int 21h
     lea si,arr1
     mov cx,10
     loopx:
     mov ah,1
     int 21h
     mov [si],al
     inc si
     loop loopx 
     mov al,'0'
     sub si,10
     lea di,arr2
     mov cx,10
     mov dl,'0' 
      
     mov dx,offset var 
     mov al,var
     mov var,al 
     outer:
     push cx
     mov cx,10
     mov var,al
     mov bl, si+var
     inner:
     cmp bl,[si]
     je true
     jmp ok
     
     true:
     inc dl
     ok:
     inc si
     loop inner 
     
     inc al
     sub si,10
     mov [di],dl
     inc di
     loop outer  
     mov dl,13
     mov ah,2
     int 21h
     mov dl,10
     mov ah,2
     int 21h                
     mov dx,offset msg2
     mov ah,9
     int 21h
     mov dl,13
     mov ah,2
     int 21h
     mov dl,10
     mov ah,2
     int 21h
     sub di,10
     mov cx,10
     display:
     mov dl,[di]
     mov ah,2
     int 21h
     inc di
     dec cx
     jnz display
     mov ah,4ch
     int 21h                
     
     
    main endp
end main
