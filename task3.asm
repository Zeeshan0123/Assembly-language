[org 0x0100]
jmp start

   num:dw 1,2,3,4,5,6,7,8,9,10
   num1:dw 11,8,9,2

   first_half:dw 0
   second_half:dw 0
   minimum:dw 0
   greater_half:dw 0
   result:dw 0
start:
  
   mov bx,0
   mov cx,10
   mov ax,[num+bx]
FrH:

  add[first_half],ax                                          
  add bx,2
  mov ax,[num+bx]                                                                   
  cmp bx,10
  jne FrH

ScH:

  mov ax,[num+bx]
  add[second_half],ax
  add bx,2 
  cmp bx,22
  jne ScH

xor ax,ax
xor bx,bx
xor cx,cx

mov cx,4
mov bx,0
mov ax,[num1]

compare:
   cmp [num1+bx],ax
   jg skip2

      mov ax,[num1+bx]

   skip2:
     add bx,2
     dec cx
     jnz compare
   mov [minimum],ax
     

start2:
 xor ax,ax
 xor bx,bx
 mov ax,[first_half]
 
 cmp [second_half],ax
 jbe max
   mov bx,[second_half]
   mov[greater_half],bx
   cmp bx,[greater_half]
   jz End 
 
 max:
  mov[greater_half],ax

 End:
     mov ax,[greater_half]
     mov bx,[minimum]
     div bx
     mov[result],ax
 mov ax,0x4c00
 int 0x21
















 










