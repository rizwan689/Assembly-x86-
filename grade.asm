.686
.MODEL flat, stdcall
.STACK

INCLUDE Irvine32.inc

.data
prompt BYTE "Enter your test Score : ",0
mygrade BYTE "Grade is : ",0


TestScore DWORD ?
ErrorMsg BYTE "Invalid Prompt !",0

.code
main PROC
Call ReadInt
mov TestScore, eax
call CheckError
call A ; 90 to 100 ? A+
call B ; 85 to 89 ? A
call AwardgradeB ; 80 to 84 ? B+
call D ; 75 to 79 ? B
call E ; 70 to 74 ? C+
call F ; 65 to 70 ? C
call G ; 60 to 64 ? D+
call H ; 55 to 59 ? D
call I ; 0 to 54 ? F

main ENDP
CheckError PROC USES edx
cmp TestScore, 0
jb displayerror

secondcondition:
cmp TestScore, 100
jbe return

displayerror:
lea edx, ErrorMsg
call WriteString
call terminate

return:
ret

CheckError ENDP

terminate PROC
   exit
terminate ENDP

A PROC USES eax
mov eax, TestScore ; 90 to 100 range ?
cmp eax, 90
jb return

secondCondition:
cmp eax, 100

call Crlf
lea edx, mygrade
call WriteString
 
mov al, 'A'
call WriteChar
mov al, '+'
call WriteChar
call terminate

 

return:
 ret

A ENDP

B PROC USES eax edx
mov eax, TestScore ; 85 to 89 range ?
cmp eax, 85
jb return

secondCondition:
cmp eax, 89
ja return

call Crlf
lea edx, mygrade
call WriteString
 
mov al, 'A'
call WriteChar
call terminate

 

return:
 ret
B ENDP

AwardgradeB PROC USES eax edx
mov eax, TestScore ; 80 to 84 range ?
cmp eax, 80
jb return

secondCondition:
cmp eax, 84
ja return

call Crlf
lea edx, mygrade
call WriteString
 
mov al, 'B'
call WriteChar
mov al, '+'
call WriteChar
call terminate

 

return:
 ret
AwardgradeB ENDP

D PROC USES eax edx
mov eax, TestScore ; 75 to 79 range ?
cmp eax, 75
jb NotFound


cmp eax, 79
ja NotFound

call Crlf
lea edx, mygrade
call WriteString
 
mov al, 'B'
call WriteChar
call terminate

 
NotFound:
 ret
D ENDP

E PROC USES eax edx
mov eax, TestScore ; 70 to 74 range ?
cmp eax, 70
jb NotFound


cmp eax, 74
ja NotFound

call Crlf
lea edx, mygrade
call WriteString
 
mov al, 'C'
call WriteChar
mov al, '+'
call WriteChar
call terminate

 
NotFound:
 ret
E ENDP

F PROC USES eax edx
mov eax, TestScore ; 65 to 70 range ?
cmp eax, 65
jb NotFound


cmp eax, 70
ja NotFound

call Crlf
lea edx, mygrade
call WriteString
 
mov al, 'C'
call WriteChar
call terminate

 
NotFound:
 ret

F ENDP

G PROC USES eax edx
mov eax, TestScore ; 60 to 64 range ?
cmp eax, 60
jb NotFound


cmp eax, 64
ja NotFound

call Crlf
lea edx, mygrade
call WriteString
 
mov al, 'D'
call WriteChar
mov al, '+'
call WriteChar
call terminate

 
NotFound:
 ret
G ENDP

H PROC USES eax edx
mov eax, TestScore ; 55 to 59 range ?
cmp eax, 55
jb NotFound


cmp eax, 59
ja NotFound

call Crlf
lea edx, mygrade
call WriteString
 
mov al, 'D'
call WriteChar
call terminate

 
NotFound:
 ret
H ENDP


I PROC USES eax edx
mov eax, TestScore ; 0 to 54 range ?
cmp eax, 0
jb NotFound



cmp eax, 54
ja NotFound

call Crlf
lea edx, mygrade
call WriteString
 
mov al, 'F'
call WriteChar
call terminate



NotFound:
 ret
I ENDP

END main





