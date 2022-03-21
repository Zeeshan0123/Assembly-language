[org 0x0100]
jmp start
  num1: dw 7,5,4,2
  s1: dw 0
  min: dw 0
start:
  mov ax,[num1]
  mov bx,0
  mov cx,4
  
Function:
  call Compare_And_Swap
  add bx,2
  mov ax,[num1+bx]
  add [s1],bx
  
  sub cx,1
  jnz Function
  mov ax,0x4c00
  int 0x21
Compare_And_Swap:
   push ax
   push bx
   push cx
   
   
   compare2:
   cmp [num1+bx],ax
   jg skip
     mov ax,[num1+bx]
     mov [min],bx
   skip:
    add bx,2
    dec cx
    jnz compare2
   swap:
     mov bx,[s1]
     mov ax,[num1+bx]
     mov bx,[min]
     xchg ax,[num1+bx]
     mov bx,[s1]
     mov [num1+bx],ax
   
   pop cx
   pop bx
   pop ax
   
  ret


  