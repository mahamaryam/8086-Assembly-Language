.model small
.stack
.data   
string1 db 'FGHIJ'
string2 db 'ABCDE'
db 5 dup (?)
.code
main proc
    
       mov ax,@data
       mov ds,ax
       mov es,ax
       lea di,string2+5
       lea si,string1
       mov cx,4
       cld 
       rep movsb
       mov cx,10
       lea si,string2
       output:
       mov dl,[si]
       mov ah,2
       int 21h
       inc si
       loop output
    
    main endp
end main
