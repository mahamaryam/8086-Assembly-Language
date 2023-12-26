.model small
.stack
.data   
arr1 db '1','2','3','4','5','6','7','8'
arr2 db 8 dup('0')
.code
main proc
    
        mov ax,@data
        mov ds,ax
        mov es,ax
        lea si,arr1
        lea di,arr2
        cld   
        mov cx,4
        aa:
        movsb
        inc si
        inc di
        dec cx
        jnz aa  
        
        mov cx,8
        lea si,arr2
        output:  
        mov dl,[si]
        mov ah,2
        int 21h 
        inc si
        loop output
        
    
    main endp
end main
