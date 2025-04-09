 .686
.MODEL flat, stdcall
.STACK

INCLUDE Irvine32.inc

.data
UserPrompt BYTE "Enter the integer : ",0
SumString BYTE "Sum of two integers is :",0


.code
 main PROC

 call Clrscr ; clears the screen

 
 
 

 mov ecx, 2
 mov ebx, 0
 
 L1:
 mov DH, 20 ; row
 mov DL, 20  ; column

 
 call Gotoxy
 lea edx, UserPrompt
 call WriteString
 call ReadInt ; read integer from concole and return in eax
 add ebx, eax

 loop L1
 call Crlf
 lea edx, SumString
 call WriteString
 

 mov eax, ebx

 call WriteInt
 
   exit
 main ENDP
 END main

 
 
 
