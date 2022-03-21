
.model small
.stack 100h
.data
menu db '******************************$'
menu1 db 'Enter 1 if Motor Bike Parks$'
menu2 db 'Enter 2 if Car Parks$'
menu3 db 'Enter 3 if Bus Parks$'
menu4 db 'Enter 4 if Cycle Parks$'   
menu5 db 'Enter 5 if Truck Parks$'
menu6 db 'Enter 6 to Check all Your Previous records$'
menu7 db 'Enter 7 to remove 01 Bike from your Parking $'
menu8 db 'Enter 8 to remove 01 Car from your Parking $' 
menu9 db 'Enter 9 to remove 01 Bus from your Parking $'  
menu10 db 'Enter 10 to remove 01 Cycle from your Parking $' 
menu11 db 'Enter 11 to remove 01 Truck from your Parking $'
menu12 db 'Press 12 to delete Your all record$'
menu13 db 'Press 13 to exit$'
menu14 db 'Note:In your Parking area maximum of 12 Vehicals will be parked at a time$'
menu15 db '******************************$'
msg1 db 'Parking Is Full$'
msg2 db 'Sorry but You have Entered a Wrong Input$'


msg7 db 'the total amount is=$'
msg8 db 'the total numbers of vehicles parked=$'
msg9 db 'the total number of Motor Bike parked=$'
msg10 db 'the total number of cars parked=$'
msg11 db 'the total number of buses parked=$'
msg12 db '****Record deleted successfully*****$'
msg13 db 'the total number of Cycle parked $' 
msg14 db 'the total number of Truck parked $'
msg15 db '01 Bike is Successfully  removed from you parking  $'
msg16 db '01 Car is Successfully  removed from you parking  $'
msg17 db '01 Bus is Successfully  removed from you parking  $' 
msg18 db '01 Cycle is Successfully  removed from you parking  $'
msg19 db '01 Truck is Successfully  removed from you parking  $'
msg20 db 'Bike Charges are: $'
msg21 db 'Car Charges are: $'  
msg22 db 'Bus Charges are: $'
msg23 db 'Cycle Charges are: $'
msg24 db 'Truck Charges are: $'
amount dw 0

count dw  '0'

trk dw '0'
bke dw '0'
c db '0'
b db '0'
cyc db '0' 

.code
main proc
mov ax,@data
mov ds,ax



while_:   
             ;Menu
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset menu
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset menu1
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset menu2
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset menu3
mov ah,9
int 21h
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset menu4
mov ah,9
int 21h
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h



mov dx,offset menu5
mov ah,9
int 21h
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset menu6
mov ah,9
int 21h
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h 

mov dx,offset menu7
mov ah,9
int 21h
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h   

mov dx,offset menu8
mov ah,9
int 21h
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h
          
mov dx,offset menu9
mov ah,9
int 21h
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h
        
mov dx,offset menu10
mov ah,9
int 21h
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h  

mov dx,offset menu11
mov ah,9
int 21h
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h
         
mov dx,offset menu12
mov ah,9
int 21h
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h  

mov dx,offset menu13
mov ah,9
int 21h
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h  

mov dx,offset menu14
mov ah,9
int 21h
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h

mov dx,offset menu15
mov ah,9
int 21h
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h

  ;userinput

mov ah, 08h
int 21h
mov dl, al
int 21h
mov bl,al     ;to sort out the issue of new line because when new line code is written then ax value will
mov dx,10     ;be changed and previous value of al will be lost
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h

  ;now compare
mov al,bl 
mov ah,0

cmp ax,'1'
je bike                  
cmp ax,'2'
je car
cmp ax,'3'
je bus  
cmp ax,'4'
je cycle11
cmp ax,'5'
je truck
cmp ax,'6'
je rec  
cmp ax,'7'
je delB 
cmp ax,'8'
je delC
cmp ax,'9'
je delBs 
cmp ax,'10'
je delCy
cmp ax,'11'
je delTr
cmp ax,'12'
je del
cmp ax,'13'
je end_


mov dx,offset msg2
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h
jmp while_ 

delB:                                                       
call delbike  


delC:                                                       
call delcar    


delBs:                                                       
call delbus  


delCy:                                                       
call delCycle 


delTr:                                                       
call delTruck 


bike:
call bikeMo   


truck:
call trrk


car:
call caar
  
cycle11:
call cyycle                               


rec:
call recrd


del:
call delt


bus:
call buss



end_:
mov ah,4ch
int 21h

main endp



 




delCycle proc
dec cyc

;sub amount,48
dec count
mov dx,offset msg18                                                
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h

xor ah, ah    ; ah = 0
int 16h       ; call BIOS function 16h


jmp while_ 

   
   
   


delTruck proc
dec trk

;sub amount,48
dec count
mov dx,offset msg19                                                
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h        

xor ah, ah    ; ah = 0
int 16h       ; call BIOS function 16h


jmp while_
  
  
  
  
  
     
delcar proc
dec c

;sub amount,48
dec count
mov dx,offset msg16                                   
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h
         
xor ah, ah    ; ah = 0
int 16h       ; call BIOS function 16h         

jmp while_ 


    
     
 
delbike proc
dec bke

;sub amount,48
dec count
mov dx,offset msg15                                    
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h  

xor ah, ah    ; ah = 0
int 16h       ; call BIOS function 16h

jmp while_ 




delbus proc
dec b

;sub amount,48
dec count
mov dx,offset msg17                                    
mov ah,9                                         
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h   

xor ah, ah    ; ah = 0
int 16h       ; call BIOS function 16h


jmp while_


     
     

trrk proc
cmp count,'11'
jle trk1
mov dx,offset msg1
mov ah,9
int 21h
jmp while_


trk1:

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h   
mov dx,offset msg24        
mov ah,9
int 21h

mov ax,450
add amount, ax
mov dx,0 ; remainder is 0
mov bx,10                                             
mov cx,0
lopp11:
        div bx
        push dx
        mov dx,0
        mov ah,0
        inc cx
        cmp ax,0
        jne lopp11
   
lopp33:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop lopp33

inc count

inc trk 

xor ah, ah    ; ah = 0
int 16h       ; call BIOS function 16h                                                  

jmp while_ 
 
 
 
 
 
 

bikeMo proc
cmp count,'11'
jle bike1
mov dx,offset msg1
mov ah,9
int 21h
jmp while_


bike1:
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h   
mov dx,offset msg20        
mov ah,9
int 21h

mov ax,30
add amount, ax
mov dx,0 ; remainder is 0
mov bx,10 
mov cx,0
l2:
        div bx
        push dx
        mov dx,0
        mov ah,0
        inc cx
        cmp ax,0
        jne l2
   
l3:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop l3

inc count

inc bke

xor ah, ah    ; ah = 0
int 16h       ; call BIOS function 16h                                                   

jmp while_



caar proc
cmp count,'11'
jle car1
mov dx,offset msg1
mov ah,9
int 21h
jmp while_


car1:
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h   
mov dx,offset msg21        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
mov ah,9
int 21h

mov ax,300
add amount, ax
mov dx,0
mov bx,10
mov cx,0
l22:
        div bx
        push dx
        mov dx,0
        mov ah,0
        inc cx
        cmp ax,0
       jne l22
   
l33:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop l33



inc count
inc c         

xor ah, ah    ; ah = 0
int 16h       ; call BIOS function 16h

jmp while_


cyycle proc
cmp count,'11'
jle cyc1
mov dx,offset msg1                   ;update it
mov ah,9
int 21h
jmp while_


cyc1: 

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h   
mov dx,offset msg23        
mov ah,9
int 21h

mov ax,60
add amount, ax
mov dx,0
mov bx,10
mov cx,0
lopp2:
        div bx
        push dx
        mov dx,0
        mov ah,0
        inc cx
        cmp ax,0
       jne lopp2
   
lopp3:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop lopp3



inc count
inc cyc        

xor ah, ah    ; ah = 0
int 16h       ; call BIOS function 16h

jmp while_





buss proc
cmp count,'11'
jle bus1
mov dx,offset msg1
mov ah,9
int 21h
jmp while_


bus1:

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h   
mov dx,offset msg22        
mov ah,9
int 21h

mov ax,400
add amount, ax
mov dx,0
mov bx,10
mov cx,0
lop2:
        div bx
        push dx
        mov dx,0
        mov ah,0
        inc cx
        cmp ax,0
       jne lop2
   
lop3:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop lop3


inc count
inc b     

xor ah, ah    ; ah = 0
int 16h       ; call BIOS function 16h

jmp while_



recrd proc
mov dx,offset msg7
mov ah,9
int 21h



mov ax, amount

mov dx,0
mov bx,10
mov cx,0
totalpush:
        div bx
        push dx
        mov dx,0
     
        inc cx
        cmp ax,0
       jne totalpush
   
totalprint:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop totalprint




mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h







mov dx,offset msg8
mov ah,9
int 21h

mov dx,count
mov ah,2
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset msg9
mov ah,9
int 21h

mov dx,bke
mov ah,2
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h



mov dx,offset msg10
mov ah,9
int 21h


mov dl,c
mov ah,2
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h



mov dx,offset msg11
mov ah,9
int 21h

mov dl,b
mov ah,2
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h

 


mov dx,offset msg13
mov ah,9
int 21h

mov dl,cyc
mov ah,2
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h 



mov dx,offset msg14
mov ah,9
int 21h

mov dx,trk
mov ah,2
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h 

xor ah, ah    ; ah = 0
int 16h       ; call BIOS function 16h
        
jmp while_ 




delt proc
mov bke,'0'
mov c,'0'
mov b,'0'
mov trk,'0'
mov cyc,'0'
mov amount,0
;sub amount,48
mov count,'0'
mov dx,offset msg12
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h

xor ah, ah    ; ah = 0
int 16h       ; call BIOS function 16h





jmp while_ 






 
 
 

end main
