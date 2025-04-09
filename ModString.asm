.686
.MODEL flat, stdcall
.STACK
INCLUDE Irvine32.inc
.data
PromptString BYTE 50 DUP(?),0

Display BYTE "Enter the String up to 50 characters : ",0



.code

main PROC
lea edx, Display
call WriteString
call Crlf
lea edx, PromptString 
mov ecx, LENGTHOF PromptString
call ReadString
call Crlf
call Uppercase

mov edx, OFFSET PromptString
call WriteString

 exit

main ENDP 
 ;******Funct Start*********
 Uppercase PROC USES ecx esi 
 mov ecx, LENGTHOF PromptString
 mov esi, 0
 

 L1:
 AND PromptString[esi], 11011111b
 inc esi
 loop L1
 ret

 ; funct to convert string to upper case
 Uppercase ENDP
 ;******Funct end*********

END main