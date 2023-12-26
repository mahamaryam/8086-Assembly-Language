.model small
.stack
.data            
arr db 10 dup(0)
.code
main proc
        
        mov ax,@data
        mov es,ax
        mov ds,ax
        lea di,arr
        mov cx,10
        cld
        input:
        mov ah,1
        int 21h
        cmp al,08
        je ok
        stosb
        jmp there
        ok:
        dec di
        jmp input
        there:
       
        loop input  
        
        mov dl,'-'
        mov ah,2
        int 21h
        lea si,arr
        mov cx,10
        
        output:
        lodsb
        mov dl,al
        mov ah,2
        int 21h
        dec cx
        jnz output
    
    main endp
end main
