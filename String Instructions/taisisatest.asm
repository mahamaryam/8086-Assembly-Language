.model small
.stack
.data   
string1 db 'T A I S I S A T E S T'
string2 db 11 dup(?)
.code
main proc
        
        mov ax,@data
        mov ds,ax
        mov es,ax 
        lea di,string2
        lea si,string1
        mov cx,11
        aa:
        cmp [si],32
        je end
        movsb
        jmp okk
        end:
        inc si 
        okk:
        
        loop aa
        
        lea si,string2
        mov cx,11
        output:
        mov dl,[si]
        inc si
        mov ah,2
        int 21h
        loop output
        
    
    main endp
end main
