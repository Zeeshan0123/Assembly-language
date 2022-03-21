[org 0x0100]
jmp start
  number: db 53
  reverse: db 0
start:
 mov bl,[number]
 mov al,[reverse]
 mov cl,8
process:
   shr bl,1
   jnc skip
     rcl al,1
     dec cl
     jnz process
     mov[reverse],al
     mov ax,0x4c00
     int 0x21
   skip:
     shl al,1
     dec cl
     jnz process
     mov[reverse],al
     mov ax,0x4c00
     int 0x21