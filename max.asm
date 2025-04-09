TITLE Finding the Maximum of 3 Integers (max.asm) 
.686 
.MODEL flat, stdcall 
.STACK 
INCLUDE Irvine32.inc 
.data 
var1 DWORD -30 ; Equal to FFFFFFE2 (hex) 
var2 DWORD 12 
var3 DWORD 7 
max1 BYTE "Maximum Signed Integer = ",0 
max2 BYTE "Maximum Unsigned Integer = ",0 
.code 
main PROC 
 ; Finding Signed Maximum 
 mov eax, var1 
 cmp eax, var2 
 jge L1 
 mov eax, var2 
L1: 
 cmp eax, var3 
 jge L2 
 mov eax, var3 
L2: 
 lea edx, max1 
 call WriteString 
 call WriteInt 
 call Crlf 
 ; Finding Unsigned Maximum 
 mov eax, var1 
 cmp eax, var2 
 jae L3 
 mov eax, var2 
L3: 
 cmp eax, var3 
 jae L4 
 mov eax, var3 
L4: 
 lea edx, max2 
 call WriteString 
 call WriteHex 
 call Crlf 
 exit 
main ENDP 
END main 