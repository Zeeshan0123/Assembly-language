.model small

.data

.code
  main proc
 
  mov dl,4
  add dl,48
  
  mov ah,2h
  int 21h
  
  jmp green
  
   mov dl,5
   add dl,48
   
   mov ah,21
   int 21h
   
   green:
    mov dl,7
    add dl,48
    
    mov ah,2h
    int 21h   
    
  endp
  end main