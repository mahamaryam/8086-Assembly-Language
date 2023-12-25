.model small
.stack
.data
arr db 20 dup(?) ;char array of size 20
msg db "Enter Array: $"
vowel db 'a','e','i','o','u','A','E','I','O','U' 
msg2 db "Vowels are $"
.code
main proc
    
     mov ax,@data
     mov ds,ax
     lea dx,msg 
     mov ah,9
     int 21h
     mov dl,13
     mov ah,2
     int 21h
     mov dl,10
     mov ah,2
     int 21h
     lea di,vowel
     lea si,arr
     mov cx,20
     loop1:
     mov ah,1
     int 21h
     mov [si],al
     inc si
     loop loop1
     
     sub si,20
     mov cx,10
     mov bl,'0'
     outer:
     push cx
     mov cx,20
     mov al,[di]
     inner:
     cmp al,[si] 
     je true
     inc si
     jmp exit
     true:
     inc bl   
     inc si
     exit:
     loop inner
     pop cx
     inc di
     sub si,20
     
     loop outer
     
     mov dx,offset msg2
     mov ah,9
     int 21h
     mov dl,bl
     mov ah,2
     int 21h
     mov ah,4ch
     int 21h
    
    main endp
end main
