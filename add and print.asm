.model small     

.data

.code   
 main proc

mov dl,2  
add dl,2

        


add dl,48
mov ah,2h  ;code for print char  

int 21h     ;print value of dl

 endp
 
 end main