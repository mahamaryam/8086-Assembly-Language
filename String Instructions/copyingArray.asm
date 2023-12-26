.model small
.stack
.data   
array1 db '1','2','3','4','5'
array2 db 5 dup(0)
.code
main proc
         
         mov ax,@data
         mov ds,ax
         mov es,ax
         lea si,array1
         lea di,array2
         cld
         mov cx,5
         rep movsb
         lea si,array2
         mov cx,5
         output: 
         mov dl,[si]
         inc si
         mov ah,2
         int 21h
         loop output
    
    main endp
end main
