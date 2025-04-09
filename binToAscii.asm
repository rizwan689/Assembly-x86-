.686
.MODEL flat, stdcall
.STACK

INCLUDE Irvine32.inc

.data
prompt1 DWORD 1 DUP(0),0
prompt2 DWORD 10101010101011001101010101010011b

.code
main PROC
call BinToAsc

  exit

main ENDP

;---------------------------------------------------------
BinToAsc PROC
;
; Converts 32-bit binary integer to ASCII binary.
; Receives: EAX = binary integer, ESI points to buffer
; Returns: buffer filled with ASCII binary digits
;---------------------------------------------------------
push ecx
push esi
mov eax, prompt2
lea esi, prompt1
mov ecx,32 ; number of bits in EAX
L1: shr eax,1 ; shift high bit into Carry flag
mov BYTE PTR [esi],'0' ; choose 0 as default digit
jnc L2 ; if no Carry, jump to L2
mov BYTE PTR [esi],'1' ; else move 1 to buffer
L2: inc esi ; next buffer position
loop L1 ; shift another bit to left
mov prompt2, eax
mov prompt1, esi
pop esi
pop ecx
ret
BinToAsc ENDP
END main