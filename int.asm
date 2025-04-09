.686
.MODEL flat, stdcall
.STACK

INCLUDE Irvine32.inc

.data
myString BYTE "Enter the signed 32-bit integers : ", 0
myPrompt SDWORD 10 DUP (?)
count DWORD SIZEOF myPrompt
errorMsg BYTE "Invalid prompt!",0
MaxValue SDWORD ?
MinValue SDWORD ?
DisplayMax BYTE "Maximum value is : ",0
DisplayMin BYTE "Minimum value is : ", 0

.code

main PROC
call userPrompt ; ten signed integers from user

lea edx, DisplayMin
call WriteString
call MiniValue ; display minimum value in the array
call Crlf
lea edx, DisplayMax
call WriteString
call Max ; display maximum value in the array

call terminate







main ENDP

;******************funct starts here *******************
userPrompt PROC USES edx eax esi

lea edx, myString 
call WriteString
mov ecx, LENGTHOF myPrompt
mov esi, 0
call Crlf
L1:
call ReadInt
call CheckError
mov myPrompt[esi], eax
add esi, TYPE myPrompt

call Crlf
loop L1

ret
userPrompt ENDP
;******************funct starts here *******************
MiniValue PROC USES eax esi ecx ebx edi
mov edi, OFFSET myPrompt
mov eax, [edi]
mov esi, 4
mov ecx, LENGTHOF myPrompt 
L1:
cmp eax, myPrompt[esi]

jge elsebody


mov MinValue, eax

jmp iterate

elsebody:
mov ebx, myPrompt[esi]
mov eax, ebx

iterate:
add esi, TYPE myPrompt

loop L1
mov eax, MinValue
call WriteInt
ret
MiniValue ENDP
;******************funct ends here *******************


;******************funct starts here *******************
Max PROC USES eax esi ecx ebx 
mov eax, myPrompt[0]
mov esi, 4
mov ecx, LENGTHOF myPrompt 
L1:
cmp eax, myPrompt[esi]

jle elsebody


mov MaxValue, eax

jmp iterate

elsebody:
mov ebx, myPrompt[esi]
mov eax, ebx
iterate:
add esi, TYPE myPrompt
loop L1
mov eax, MaxValue
call WriteInt
ret

Max ENDP
;******************funct ends here *******************


;******************funct starts here *******************
CheckError PROC


test al, 
jz return




Displayerror:
lea edx, errorMsg
call WriteString
call terminate

return:
 ret

CheckError ENDP

;******************funct ends here *******************
terminate PROC

 exit

terminate ENDP

END main


