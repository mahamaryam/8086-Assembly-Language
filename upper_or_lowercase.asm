.model small
.stack 
.data     
msg db "Enter number:$"
msgg db "Number is lowercase$"
msg3 db "Number is uppercase$"
num db ?
.code
main proc
     
     ;upper to lowercase
     mov ax,@data
     mov ds,ax
     mov dx,offset msg
     mov ah,9
     int 21h
     mov dx,offset num
     mov ah,1
     int 21h
     mov num,al
     mov dl,13
     mov ah,2
     int 21h
     mov dl,10
     mov ah,2
     int 21h
     
     cmp num,97
     jae true
     mov dx,offset msg3
     mov ah,9
     int 21h
     jmp exit
     
     true:
     mov dx,offset msgg
     mov ah,9
     int 21h 
     exit:
    
    main endp
end main
