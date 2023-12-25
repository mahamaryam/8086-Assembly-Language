;monday synady etc using array
.model small
.stack 
.data     
msg db "Enter number of day:$"
mon db "Monday$"
tue db "Tuesday$"
wed db "Wednesday$"
thu db "Thursday$"
fri db "Friday$"
sat db "Saturday$"
sun db "Sunday$"
def db "No such value exists!$"
main proc
     
      mov ax,@data
      mov ds,ax
      lea dx,msg
      mov ah,9
      int 21h
      mov dl,13
      mov ah,2
      int 21h
      mov dl,10
      mov ah,2
      int 21h
      mov ah,1
      int 21h  
      cmp al,49
      je true
      jmp tues
      true:
      mov dx,offset mon
      mov ah,9
      int 21h 
      mov ah,4ch
      int 21h 
      tues: 
      cmp al,50
      je truet
      jmp weds
      
      truet:
      mov dx,offset tue
      mov ah,9
      int 21h 
      mov ah,4ch
      int 21h
      weds:
      cmp al,51
      je truew
      jmp thru
      truew:
      mov dx,offset wed
      mov ah,9
      int 21h 
      mov ah,4ch
      int 21h
              
      thru:
      cmp al,52
      je thrut
      jmp frio
      thrut:
      mov dx,offset thu
      mov ah,9
      int 21h 
      mov ah,4ch
      int 21h
      frio:
      cmp al,53
      je frit
      jmp sats
      frit:
      mov dx,offset fri
      mov ah,9
      int 21h 
      mov ah,4ch
      int 21h
      sats:
      cmp al,54
      je satt
      jmp suns
      satt:
      mov dx,offset sat
      mov ah,9
      int 21h
      mov ah,4ch
      int 21h
      suns:
      cmp al,55
      je sunt
      jmp default
      sunt: 
      mov dx,offset sun
      mov ah,9
      int 21h 
      mov ah,4ch
      int 21h
      default:
      lea dx,def
      mov ah,9
      int 21h
      mov ah,4ch
      int 21h      
      
    main endp
end main
