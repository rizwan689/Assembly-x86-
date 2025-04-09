.686
.MODEL flat, stdcall
.STACK

INCLUDE Irvine32.inc

.data


.code

 main PROC
 

 mov ecx, 100
 
 
 
 L1:
 mov eax, 80 ; 0 to 79

 call RandomRange
 mov dl, al

 mov eax, 25 ; 0 to 24
 call RandomRange
 mov dh, al

 call Gotoxy ; locate cursor

 mov eax,100 ; 1 second
 call Delay

 mov al, 2Ah
 call WriteChar
 

 loop L1
 
 exit
 main ENDP
 END main




