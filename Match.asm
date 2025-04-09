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

call CheckChar


lea edx, PromptString
call WriteString

 exit

main ENDP 
CheckChar PROC USES esi ecx edx
mov esi, 0
mov ecx, LENGTHOF  PromptString

call ReadChar
L1:
cmp PromptString[esi], al
jnz next
Found:
mov PromptString[esi], ' '

next:
inc esi

loop L1


ret
 
CheckChar ENDP


END main