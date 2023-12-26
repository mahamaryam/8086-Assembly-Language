//without index number
.model small
.stack 
.data   
msg db "Enter array: $"
arr db 10 dup(?)
result db "Peak element is $"
.code
main proc
    
    mov ax,@data
    mov ds,ax
    lea dx,msg
    mov ah,9
    int 21h
    mov cx,10
    lea si,arr
    loopx:
    mov ah,1
    int 21h
    mov [si],al
    inc si
    dec cx
    jnz loopx
    
    sub si,10
   
    mov cx,8  
    
    peak: 
    
    mov al,[si]
    add si,1
    mov bl,[si]
    add si,1
    mov dl,[si]
    
    cmp bl,al
    
    ja true
   
    jmp exit
    
    true:
    cmp bl,dl
    ja tru
    jmp exit
    
    tru:
    lea dx,result
    mov ah,9
    int 21h
    mov dl,bl
    mov ah,2
    int 21h
    mov ah,4ch
    int 21h
    
    exit:
    dec cx
    dec si  
    
    jnz peak
     
     
    
    main endp
end main














//peak element with index number
.model small
.stack 
.data   
msg db "Enter array: $"
arr db 10 dup(?)
result db "Peak element is $" 
index db " at index $"
.code
main proc
    
    mov ax,@data
    mov ds,ax
    lea dx,msg
    mov ah,9
    int 21h
    mov cx,10
    lea si,arr
    loopx:
    mov ah,1
    int 21h
    mov [si],al
    inc si
    dec cx
    jnz loopx
    
    sub si,10
   
    mov cl,8  
    
    peak: 
    
    mov al,[si]
    add si,1
    mov bl,[si]
    add si,1
    mov dl,[si]
    
    cmp bl,al
    
    ja true
   
    jmp exit
    
    true:
    cmp bl,dl
    ja tru
    jmp exit
    
    tru:
    lea dx,result
    mov ah,9
    int 21h
    mov dl,bl
    mov ah,2
    int 21h
    mov dx,offset index
    mov ah,9
    int 21h
    mov bl,10
    sub bl,cl
    mov dl,bl
    add dl,48
    mov ah,2
    int 21h
    mov ah,4ch
    int 21h
    
    exit:
    dec cl
    dec si  
    
    jnz peak
     
     
    
    main endp
end main
