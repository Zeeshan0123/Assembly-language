[org 0x0100]

jmp start
     message: db 'p20-0569'
     lenght: dw 8
     
     clrscr:
       push ax
       push es
       push di
       mov ax,0xb800
       mov es,ax
       mov di,0

       nextloc:
           mov word[es:di],0x0720
           add di,2
           cmp di,4000
           jne nextloc
       pop di
       pop es
       pop ax
       ret

    printstr:
       push bp
       mov bp,sp
       push ax
       push es
       push di
       push si
       push cx

       mov ax,0xb800
       mov es,ax
       mov di,1830
       mov si,[bp+6]
       mov cx,[bp+4]
       mov ah,0x07

       nextchar:
            mov al,[si]
            mov word[es:di],ax
            add di,2
            add si,1
            dec cx
            jnz nextchar
      pop cx
      pop si
      pop di
      pop es
      pop ax
      mov sp,bp
      pop bp
      ret 4
            

start:
  call clrscr
  mov ax,message
  push ax
  push word[lenght]
  call printstr

  mov ah,0x1
  int 0x21
  mov ax,0x4c00
  int 0x21