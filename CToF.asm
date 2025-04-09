.686
.MODEL flat, stdcall
.STACK

INCLUDE Irvine32.inc

.data
Celsius WORD 40
Fahrenheit WORD 1 DUP(0),'F'

.code
main PROC
call Convert2F
  exit





main ENDP 
Convert2F PROC USES eax ebx
mov ax, Celsius

mov bl, 9
mul bl ; ax = 360
mov bl, 5
cwd
div bl ; 360 / 5 = 72 ; ax = quotient dx = remainder
add ax, 32

mov Fahrenheit[0], ax
ret




Convert2F ENDP

END main