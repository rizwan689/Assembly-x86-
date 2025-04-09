.686
.MODEL flat, stdcall
.STACK

INCLUDE Irvine32.inc

.data
UserPrompt BYTE ?
DisplayPrompt BYTE "Enter the character : ",0
Result BYTE "Converted character into number is :",0
Number BYTE ?
ErrorMsg BYTE "Invalid Prompt !",0
numarray BYTE 00001010b,00001011b,00001100b,00001101b,00001110b,00001111b

.code


main PROC
lea edx, DisplayPrompt

call Input
mov al, UserPrompt
call isdigit ; is there anydigit?
jnz secondCondition

Found:
call Crlf
lea edx, Result
call WriteString
call Conversion




call terminate

secondCondition:
call Checklower ; is there alphabat 'a' to 'f' range?
jz Found
jnz ThirdCondition

ThirdCondition:
call CheckUpper ; is there alphabat 'A' to 'F' range?
jz Found
call DisplayError



main ENDP 

terminate PROC

  exit
terminate ENDP

DisplayError PROC USES edx 
lea edx, ErrorMsg
call WriteString
call Crlf
call terminate

ret

DisplayError ENDP

Input PROC USES edx eax
lea edx, DisplayPrompt
call WriteString
call ReadChar
mov UserPrompt, al







 ret
Input ENDP



Conversion PROC USES eax esi ebx
mov eax, 0
mov al, UserPrompt

call isdigit ; 0 to 9 ?
jnz Alphabats

AND al, 00001111b ; suppose digit in al
call WriteInt

jmp return





Alphabats:

mov esi, -1

L1:
mov al, UserPrompt
inc esi
mov bl, al
xor al, numarray[esi]

xor al, bl

cmp al, numarray[esi]

jnz L1

return:




ret

Conversion ENDP

Checklower PROC USES eax
mov al, UserPrompt
cmp al, 'a'
jb return

cmp al, 'f'
ja return

test al, 0 ; set zf in case of a to f range otherwise display error




return:
ret
Checklower ENDP

CheckUpper PROC USES eax
mov al, UserPrompt
cmp al, 'A'
jb return

cmp al, 'F'
ja return

test al, 0 ; set zf in case of a to f range otherwise display error




return:
ret

CheckUpper ENDP

END main