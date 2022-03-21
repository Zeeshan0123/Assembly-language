

SECTION .text: 

GLOBAL _start 
_start:
        mov eax,0
        mov ebx,10
        mov ecx,20
        push ecx
        push ebx
        call    sum                                    ;return value is stored in eax
        mov eax, 0x1
        mov ebx,0 					; exit code is 0 (return 0) 
	int 0x80
        
       
  sum:
    push ebp
    mov ebp,esp

    push ebx
    push ecx
    
    mov ebx,[ebp+8]
    add eax,ebx
    mov ecx,s[ebp+12]
    add eax,ecx

    pop ecx
    pop ebx
    mov esp,ebp
    pop ebp

    ret 8
    
SECTION .data: