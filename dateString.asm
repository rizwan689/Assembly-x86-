.686
.MODEL flat, stdcall
.STACK

INCLUDE Irvine32.inc

.data
dateString BYTE 25 DUP(0)
day BYTE ?
month BYTE ?
year BYTE ?
.code
main PROC
mov ax, 0011010100110001b
call Convert2string



main ENDP 
Convert2string PROC
mov bx, ax
AND bl,00011111b
mov day, bl
mov bx, ax
shr bx, 5 ; 0000000110101001
AND bl, 00001111b ; 00001001
mov month, bl
mov bh, ah
shr bh, 1
mov year, bh

mov ecx, 5
mov esi, OFFSET dateString

L1:
mov al, day
shl al, 1
mov BYTE ptr [esi], '0'
jnc L2
mov BYTE ptr [esi] , '1'

L2: inc esi
loop L1
mov ecx, 4
L7:
mov al, month
shl al, 1
mov BYTE ptr [esi], '0'
jnc L4
mov BYTE ptr [esi] , '1'

L4: inc esi
loop L7
mov ecx, 7
L6:
mov al, year
shl al, 1
mov BYTE ptr [esi], '0'
jnc L5
mov BYTE ptr [esi] , '1'

L5: inc esi
loop L6
mov BYTE ptr [esi], 0
ret

Convert2string ENDP
END main
