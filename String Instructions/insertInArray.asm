.model small
.stack
.data   
arr db '1','2','4','5','6',?
.code
main proc
         
         mov ax,@data
         mov ds,ax
         mov es,ax
         lea si,arr+4
         lea di,arr+5
         mov cx,3 
         std
         rep movsb
         lea si,arr
         mov [si+2],'3'
         mov cx,6
         output:
         mov dl,[si]
         mov ah,2
         int 21h
         inc si
         loop output
    
    main endp
end main
