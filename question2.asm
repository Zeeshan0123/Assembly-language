
SECTION .text: 

 
GLOBAL _start 

_start: 
	; write the string to console 
	mov eax, 0x4 				 
	mov ebx, 1 					 
	mov ecx, message 			 
	mov edx, message_length 	 		           ;firstly we print first string
	int 0x80 					 


       
       mov [message]," zeeshan"
       mov[message_length], equ $-message

        mov eax, 0x4 				
	mov ebx, 1 					 ; then over write it and print the next string
	mov ecx, message 			 
	mov edx, message_length 			
	int 0x80 

        ; exit the program 
	mov eax, 0x1 				 
	mov ebx, 0 					 
	int 0x80 					  

       

	
 
SECTION .data: 
	; 0xA is new line, 0x0 is null terminator 
	message: db "p200569",  0xA,  0x0 
	message_length: equ $-message 

	






 

