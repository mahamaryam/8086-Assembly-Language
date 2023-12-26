.model small
.stack
.data   
counter db 0
msg db "Enter Password: $"
length db 0
upper_case_letter db 0
lower_case_letter db 0
number db 0    
short db 10,13,"Passoword length is too short!$"
weak db 10,13,"Password is weak!$"
strong db 10,13,"Password is strong!$"
very_strong db 10,13,"Password is very strong!$"
re_enter db 10,13,"Re-enter Password?$"
term db 10,13,"Program terminated!$"
.code
main proc
    
      mov ax,@data
      mov ds,ax
      start:   
      mov dx,offset counter
      mov dx,offset msg
      mov ah,9
      int 21h 
      xor ax,ax
      mov ah,1 
      mov cx,0 
        mov dx,offset length
      input:
      int 21h
      cmp al,0dh
      je end
      push ax 
      inc cx
      inc length
      jmp input
      end:
      cmp length,8
      jb no
      jmp length_ok
      
      no:
      mov dx,offset short
      mov ah,9
      int 21h
        
      again:
      mov dx,offset re_enter
      mov ah,9
      int 21h
      mov ah,1
      int 21h
      cmp al,'y'
      je start
      jmp final
      length_ok:
      
      mov dx,offset number
      mov dx,offset upper_case_letter
      mov dx,offset lower_case_letter
    
      
      count:
      pop ax
      cmp ax,30h
      jae number_end
      cmp ax,41h
      jae letter_end
      cmp ax,61h
      jae lletter_end
      number_end:
      cmp ax,39h
      jbe isnumber 
      letter_end:
      cmp ax,5Ah
      jbe isuppercase
      lletter_end:
      cmp ax,7Ah
      jbe islowercase
      
      
      isnumber:
      inc number
      jmp there 
      isuppercase:
      inc upper_case_letter
      jmp there 
      islowercase:
      inc lower_case_letter 
      jmp there
      there: 
      dec cx
      jnz count  
      
      cmp number,0
      ja pass1 
      t1:
      cmp lower_case_letter,0
      ja pass2      
      t2:
      cmp upper_case_letter,0
      ja pass3
      pass1:
      inc counter 
      jmp t1
      pass2:
      inc counter
      jmp t2
      pass3:
      inc counter
      
      cmp counter,1
      je weak_password
      cmp counter,2
      je strong_password 
      cmp counter,3
      je so_strong
      weak_password:
      mov dx,offset weak
      mov ah,9
      int 21h
      jmp again 
      strong_password:
      mov dx,offset strong
      mov ah,9
      int 21h  
      jmp again 
      so_strong:
      mov dx,offset very_strong
      mov ah,9
      int 21h  
      jmp again
      
      
       
       
       final:
       mov dx,offset term
       mov ah,9
       int 21h
       mov ah,4ch
       int 21h
    
    main endp
end main
