.686
.MODEL flat, stdcall
.STACK

INCLUDE Irvine32.inc

.data

Myname BYTE "rizwan zahid",0

.code

main PROC

 mov edx, OFFSET Myname
 call WriteString

 call Crlf

 call Uppercase
 
 mov edx, OFFSET Myname
 call WriteString
 call Crlf

 call Lowercase
 
 mov edx, OFFSET Myname
 call WriteString
 
 
 

 


 

main ENDP


 ;******Funct Start*********
 Uppercase PROC USES ecx esi 
 mov ecx, LENGTHOF Myname
 mov esi, OFFSET Myname

 L1:
 AND BYTE ptr [esi], 11011111b
 inc esi
 loop L1
 ret

 ; funct to convert string to upper case
 Uppercase ENDP
 ;******Funct end*********

 ;******Funct Start*******
 Lowercase PROC
 mov ecx, LENGTHOF Myname
 mov esi, OFFSET Myname

 L1:
 OR BYTE ptr [esi], 00100000b
 inc esi 
 loop L1
 ret


 Lowercase ENDP
 ;******Funct Start*******


END main