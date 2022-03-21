[org 0x0100]

jmp start
 Factorial_D: dw 0
 power_D: dw 0
 Answer: dw 0                    ;All answers are stored in it
start:

mov ax,5                             ;it is actually n
push ax
call Summation
mov ax,[Answer]
mov ax,0x4c00
int 0x21

Summation:
  push bp
  mov bp,sp
  push cx
  push bx
  mov cx,[bp+4]
  inc cx                ;  start with k0 to k5        we have to execute loop 6 times
  mov bx,0              ;it is actually k

  loop1:
     mov ax,2          
     mov dx,-1         ; (-1)
     mul bx            ;2k
     inc ax            ;2k+1
     push ax
     call factorial     ;it will find (2k+1)! and stored answer in Factorial_D
     push dx
     push bx
     call power         ;it will find (-1)^k and stored answer in power_D
     push word[Factorial_D]
     push word[power_D]
     call Final         ;at last we will divide both values
     mov word[Factorial_D],0
     mov word[power_D],0
     inc bx
     loop loop1
  pop bx
  pop cx
  mov sp,bp
  pop bp
  ret 2

factorial:
   push bp
   mov bp,sp
   push ax
   push bx
   push cx
   push dx

   mov ax,[bp+4]
   mov dx,[bp+4]          ;
   dec dx
   jnz skip
     mov[Factorial_D],ax          ;if ax=1
      pop dx
      pop cx
      pop bx
      pop ax
      mov sp,bp
      pop bx
      ret 2
   skip:
   mov cx,[bp+4]          ;
   dec cx
   mov bx,[bp+4]          ;
   loop2:
      dec bx
      mul bx
      loop loop2
   mov[Factorial_D],ax
   pop dx
   pop cx
   pop bx
   pop ax
   mov sp,bp
   pop bx
   ret 2

power:
  push bp
  mov bp,sp
  push ax
  push bx
  push cx
  push dx

  mov ax,[bp+6]   ; -> dx=-1
  mov cx,[bp+4]   ; -> bx

  cmp cx,0
  mov word[power_D],1
  pop dx
  pop cx
  pop bx
  pop ax
  mov sp,bp
  pop bp
  ret 4
  
  cmp cx,1
  mov word[power_D],-1
  pop dx
  pop cx
  pop bx
  pop ax
  mov sp,bp
  pop bp
  ret 4
 
  dec cx            ;because if cx means k = 2 then first decriment it and then mul and loop will execute 1 time
  loop3:
     mul ax
     loop loop3
     mov[power_D],ax
     pop dx
     pop cx
     pop bx
     pop ax
     mov sp,bp
     pop bp
     ret 4


Final:
  push bp
  mov bp,sp
  push ax
  push bx

  mov ax,[bp+4]     ;power_D
  mov bx,[bp+6]     ;factoral_D
  div bx
  add [Answer],ax

  pop bx
  pop ax
  mov sp,bp
  pop bp
 
  ret 4 






   