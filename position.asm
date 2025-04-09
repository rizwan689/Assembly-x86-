.686
.MODEL flat, stdcall
.STACK

INCLUDE Irvine32.inc

.data
Myarray DWORD 1,2,3,4,5,6,7,8,9,10

.code
main PROC

call previousPosition






  exit
main ENDP
;funct start ***

previousPosition PROC USES ecx esi edi ebx


mov ecx, LENGTHOF Myarray
mov esi, OFFSET Myarray + 1
mov edi, 0
mov ebx, 0

L1:
mov ebx, [esi]
mov Myarray[edi], ebx

add esi, TYPE Myarray
add edi, TYPE Myarray
loop L1
ret
previousPosition ENDP

;funct end ***

END main