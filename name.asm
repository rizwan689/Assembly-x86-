.686
.MODEL flat, stdcall
.STACK

INCLUDE Irvine32.inc

.data 
colors DWORD blue,red,green,yellow
Myname BYTE "My name is Rizwan Zahid. ",0
Myname2 BYTE "I am doing Major in Computer Science ",0
StoreName DWORD ?

.code
main PROC
mov esi, OFFSET colors
mov ecx, LENGTHOF colors

L1:

mov eax, [esi]+(black*16) ; blue = 1 and black = 0 
 call SetTextColor ; set yellow text on blue background 

lea edx, Myname
call WriteString
call Crlf

add esi, TYPE colors

loop L1





  
  exit
main ENDP
END main



