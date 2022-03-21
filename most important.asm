.model small

.data
     message db "Enter a number $"
     message2 db " Enter another number $"
     message3 db " + $"
     message4 db " = $"

.code
  main proc
    
    mov ax,seg message
    mov ds,ax
    mov dx,offset message
    mov ah,9h
    int 21h
    
    mov ah,1h     ;stored in al
    int 21h
    
    mov bl,al     ;first input
    
    
    mov ax,seg message2
    mov ds,ax
    mov dx,offset message2
    mov ah,9h
    int 21h
    
    mov ah,1h   ; input stored in al ;input as a character if we do some math on it then first convert in to decimal
    int 21h
    
    mov cl,al    ;second input
    
    mov dl,bl   ; display first input
    mov ah,2h
    int 21h
    
    mov ax,seg message3
    mov ds,ax                    ;display +
    mov dx,offset message3
    mov ah,9h
    int 21h
    
    mov dl,cl
    mov ah,2h                    ;display second input
    int 21h  
    
    mov ax,seg message4
    mov ds,ax
    mov dx,offset message4            ;display =
    mov ah,9h
    int 21h
    
                          ;do a simple math
    sub bl,30h            ;convert to decimal
    sub cl,30h   
    
    add bl,cl              
    
    add bl,30h             ; we want to print characte
    
    mov dl,bl
    
    mov ah,2h
    int 21h
    
    
  endp
  
end main