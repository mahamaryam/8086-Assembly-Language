. Do programming exercise 10, except that if the user fails to enterahex-digit 
character In three tries, display a message and terminatethe program



.model small
.stack
.data
msg db "Enter hex digit: $"
msg2 db "Equivalent decimal number is $"
msg3 db "Invalid Input! $"
msg4 db "Do you want to continue? $"
msg5 db "Program Terminated!$"
count db '0'
enuf db "Too many tries! $"
.code
main proc
    
    mov ax,@data
    mov ds,ax  
    mov dx,offset count
    mov cl,'0'
    start: 
    mov dl,13
    mov ah,2
    int 21h
    mov dl,10
    mov ah,2
    int 21h
    lea dx,msg
    mov ah,9
    int 21h
    mov ah,1
    int 21h      
    MOV BL,AL
   
    cmp al,'F'
    ja true
    jmp con2
    
    true: 
    mov dl,13
    mov ah,2
    int 21h
    mov dl,10
    mov ah,2
    int 21h
    mov dx,offset msg3
    mov ah,9
    int 21h 
    inc cl
    cmp CL,'3'
    ja enough
    
    jmp aa
    con2:
    cmp al,'A'
    jb true2
    jmp final
    
    true2:
    mov dx,offset msg3
    mov ah,9
    int 21h  
    jmp aa
    final:  
    mov dl,13
    mov ah,2
    int 21h
    mov dl,10
    mov ah,2
    int 21h
    mov dx,offset msg2
    mov ah,9
    int 21h 
    MOV CL,'0'
    mov dl,'1'
    mov ah,2
    int 21h
    sub bl,17
    mov dl,bl
    mov ah,2
    int 21h
    mov dl,13
    mov ah,2
    int 21h
    mov dl,10
    mov ah,2
    int 21h   
    aa:
    mov dx,offset msg4
    mov ah,9
    int 21h
    mov ah,1
    int 21h
    cmp al,'Y'
    je yes
    jmp alt
    yes:
    jmp start
    alt:
    cmp al,'y'
    je start
    jmp endd
    endd:
    
    mov dl,13
    mov ah,2
    int 21h
    mov dl,10
    mov ah,2
    int 21h 
   
    mov dx,offset msg5
    mov ah,9
    int 21h
    mov ah,4ch
    int 21h
    
    enough: 
    mov dl,13
    mov ah,2
    int 21h
    mov dl,10
    mov ah,2
    int 21h
    mov dx,offset enuf
    mov ah,9
    int 21h
    jmp endd
    
    
    
    main endp
end main
