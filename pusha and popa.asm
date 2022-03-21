.model small 

.data

.code 
  main proc  
      
             ;pusha ax,cx,dx,sp,bp,si,di 
             
   mov ax,1
   mov bx,1
   mov cx,1
   
   pusha
   
   mov ax,5
   mov bx,5
   mov cx,5
   
   popa           ;simply it retreve the data
    
  endp
  end main
    