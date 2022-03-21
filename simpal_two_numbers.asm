 .model small
.data

.code

  mov ah ,1h     ;code for read a character 
  
  int 21h        ;dos interrupt
  
  mov dl,al
  
  mov ah,2h    ;code for write a character
  
  int 21h
  
  end
