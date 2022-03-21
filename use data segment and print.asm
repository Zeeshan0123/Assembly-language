.model small

.data
  count db 2
  
.code
main proc
 
  mov dl,count
  
  add dl,48
  
  mov ah,2h
  int 21h
  
endp

end main