.686
.MODEL flat, stdcall
.STACK

INCLUDE Irvine32.inc

.data
Hexaarray BYTE "01",0
Hexbuffer BYTE 10 DUP (0)

.code
main PROC
call Convert2bin
  exit

main ENDP
Convert2bin PROC USES ecx edx eax ebx 
mov ecx, 10
lea edx, Hexbuffer
mov eax, 987654321

L1:
rol eax, 3
mov ebx, eax
AND	 ebx, 7
mov bl, Hexaarray[ebx]
mov [edx], bl
inc edx
loop L1
mov BYTE PTR [edx], 0

ret

Convert2bin ENDP
END main
