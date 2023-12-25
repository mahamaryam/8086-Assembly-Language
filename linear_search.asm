
;program to search whether two arrays are equal
;greatest of three
;practice unconditional jumps
 
.model small
.stack
.data 
arr db 10 dup(?) 
msg1 db "Enter array: $"
msg2 db "Enter number to search:$"   
msg9 db "Number found at index $" 
msg3 db "Number not found$"
.code
main proc     
    
  mov ax,@data
  mov ds,AX 
  mov dx,offset msg1
  mov ah,9
  int 21h
  
  mov si,offset arr  
  mov cx,10     
  
  loopw:
  mov ah,1
  int 21h
  mov [si],al
  inc si
  dec cx
  jnz loopw
  
  mov dl,13
  mov ah,2
  int 21h
  mov dl,10
  mov ah,2
  int 21h
     
  sub si,10
  mov dx,offset msg2
  mov ah,9
  int 21h
  mov ah,1
  int 21h  ;al has number to search
  
  mov bx,10
  mov cx,10
  loop1:
  cmp al,[si]
  je aa
  
  inc si
  dec cx
  jmp end_i
  
  aa: 
  mov dx,offset msg9
  mov ah,9
  int 21h 
  sub bx,cx
  mov dx,bx 
  add dx,48
  mov ah,2
  int 21h
  mov ah,4ch
  int 21h
  
  end_i:
  
  jnz loop1   
        
  mov dx,offset msg3
  mov ah,9
  int 21h
  mov ah,4ch
  int 21h      
    
    main endp
end main
