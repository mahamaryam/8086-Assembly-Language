.model small
.stack
.data 
var db 0          
counter db 26
capital db 'A'
small db 'a'
table db 01h,02h,03h,04h,05h,06h,07h,08h,09h,10h,11h
      db 12h, 13h,14h,15h,16h,17h,18h,19h,20h,21h,22h,23h
      db 24h,25h,26h
       
number db 0
 reverse db 25 
.code
main proc
           
        mov ax,@data
        mov ds,ax
        mov bx,offset table
        mov dx,offset capital
        mov dx,offset small 
        mov dx,offset counter
        mov dx,offset number
        mov dx,offset reverse
        mov dx,offset var
        
        mov cx,0
        print:
        mov dl,capital
        mov ah,2
        int 21h
       
        mov dl,32
        mov ah,2
        int 21h
        int 21h
        
        mov dl,small
        mov ah,2
        int 21h
        mov dl,32
        mov ah,2
        int 21h
        int 21h
        
        mov ax,0
        mov al,number
        xlat
       mov var,al
       shr al,4
       mov dl,al
       add dl,48
       mov ah,2
       int 21h
       mov al,var
       shl al,4
       shr al,4
       mov dl,al
       add dl,48
       mov ah,2
       int 21h 
       
       mov dl,32
       mov ah,2
       int 21h
       int 21h
       
       mov ax,0
       mov al,reverse
       xlat
       mov var,al
       shr al,4
       mov dl,al
       add dl,48
       mov ah,2
       int 21h
       mov al,var
       shl al,4
       shr al,4
       mov dl,al
       add dl,48
       mov ah,2
       int 21h   
       mov dl,13
       mov ah,2
       int 21h
       mov dl,10
       mov ah,2
       int 21h
       
       dec counter
       inc capital
       inc small
       dec reverse
       inc number
       cmp counter,0
       je end_program
       jmp print
       
       end_program:
       mov ah,4ch
       int 21h
       
        
        
    
    main endp
end main
