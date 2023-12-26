.model small
.stack
.data
string db 5 dup(0)
.code
main proc
        
        mov ax,@data
        mov ds,ax
        mov es,ax
        lea di,string 
        cld   
        mov cx,5
        input:
        mov ah,1
        int 21h
        stosb    
        dec cx
        jnz input 
        
        lea si,string
        mov dl,'-'
        mov ah,2
        int 21h
        lea si,string+4  
        std        
        mov cx,5
        
        output:
        lodsb
        mov dl,al
        mov ah,2
        int 21h
        loop output
    
    main endp
end main
