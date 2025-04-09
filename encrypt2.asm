TITLE String Encryption  (encrypt.asm)

.686
.MODEL flat, stdcall
.STACK 4096

INCLUDE Irvine32.inc

.data

string      BYTE    "Attack at dawn.", 0
key         BYTE     00011010b

.code
main PROC
    mov  al,  key           ; pass the parameters
    mov  ecx, SIZEOF string
    dec  ecx                ; don't count the null char
    lea  edx, string
    call encrypt            ; Encrypt the string
    call encrypt            ; Decrypt the string
    exit
main ENDP

; Encrypt a string pointed by EDX according to an 8-bit key passed in AL
; Receives: AL  = 8-bit key
;           ECX = length of string to be encrypted
;           EDX = address of string to be encrypted
; Returns:  replace string pointed by EDX with the encrypted one

encrypt PROC
    push ecx                ; save registers
    push edx
L1:
    xor  [edx], AL          ; encrypt char pointed by edx
    inc  edx                ; point to next character
    loop L1
    call WriteString
    call Crlf

    pop  edx                ; restore register values
    pop  ecx
    ret                     ; return
encrypt ENDP
END main