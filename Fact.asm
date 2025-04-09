; Calculating a Factorial (Fact.asm)
.686
.MODEL flat, stdcall
.STACK

 INCLUDE Irvine32.inc
.code
 main PROC
 push 5
 call Factorial
 call WriteDec
 call Crlf
 exit
 main ENDP
 ; calc 5!
 ; calculate factorial (EAX)
 ; display it
 ;---------------------------------------------------
Factorial PROC
 ; Calculates a factorial.
 ; Receives: [ebp+8] = n, the number to calculate
 ; Returns: eax = the factorial of n
 ;---------------------------------------------------
push ebp
 mov ebp,esp
 mov eax,[ebp+8]
 ; get n
 cmp eax,0
 ja L1
 ; n 0?
 ; yes: continue
 mov eax,1
 jmp L2
 ; no: return 1 as the value of 0!
 ; and return to the caller

 L1: dec eax
 push eax
 call Factorial
 ; Factorial(n 1)
 ; Instructions from this point on execute when each 
; recursive call returns.
 ReturnFact:
 mov ebx,[ebp+8]   
; get n
 mul ebx          
L2: pop ebp
 ret 4
 Factorial ENDP
 END 