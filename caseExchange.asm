;Uppercase to lowercase
.model small
.stack
.data
.code
main proc
    
     ;capitalize every word in a sentence 
     
     mov ah,1
     int 21h
     cmp al,90
     jbe true
     
     jmp exit
     
     true:
     add al,32
     mov dl,al
     mov ah,2
     int 21h 
     
     exit:
    
    main endp
end main








;lowercase to uppercase
.model small
.stack
.data
.code
main proc
    
     ;capitalize every word in a sentence 
     
     mov ah,1
     int 21h
     cmp al,97
     jae true
     
     jmp exit
     
     true:
     sub al,32
     mov dl,al
     mov ah,2
     int 21h 
     
     exit:
    
    main endp
end main
