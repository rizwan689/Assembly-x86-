.686
.MODEL flat, stdcall
.STACK

INCLUDE Irvine32.inc

.data
;Mychar BYTE 41h,42h,43h,44h,45h,46h,47h,48h,49h,4Ah,4Bh,4Ch,4Dh,4Eh,4Fh,50h,51h,52h,53h,54h,55h,56h,57h,58h,59h,5Ah
MyString BYTE 10 DUP (?)
MyDisplay BYTE "ten random String are : ",0
count DWORD ?

.code
 main PROC
mov ecx, 20 ; outer loop
mov count, ecx

lea edx, MyDisplay
call WriteString 
call Crlf

L1:
 mov count, ecx ; save outer loop count 


 mov ecx, 10 ; inner loop
 mov esi, 0
 

 L2:
 mov eax, 26; 0 to 25
 call RandomRange
 add eax, 65 ; 65 to 90
  
 
 mov MyString[esi], al
 inc esi
 
 
 
 loop L2
 mov BYTE ptr MyString[esi], 0 ; terminate the string
 lea edx, MyString
 call WriteString
 call Crlf
 mov ecx, count
 loop L1

   exit
  main ENDP
  END main
