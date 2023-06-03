.model tiny
org 100h
.data
str1 DB 'Enter first number ->','$'
str2 DB 13,10,'Enter second number ->','$'
str3 DB 13,10,'Division ->','$'

celoe DB 0
counter DB 0
multiplier DW 1
tmp DW 0

.code
mov ah,9
mov dx,offset str1
int 21h
call getNumToAX
push ax

mov ah,9
mov dx,offset str2
int 21h
call getNumToAX
push ax

mov ah,9
mov dx,offset str3
int 21h

pop dx
pop ax
idiv dl

;need to output result to console

mov bl,10
B:
cmp ax,0
jle B2
idiv bl
mov celoe,al
xchg al,ah
cbw
push ax
inc counter
mov al,celoe
cbw
jmp B
B2:
cmp counter,0
jle exit2
pop dx
dec counter
add dl,30h
mov ah,2
int 21h
jmp B2
exit2:

ret

getNumToAX PROC ;aka cin » ax

A:
mov ah,1
int 21h
cmp al,13
je A2
sub al,30h
cbw
push ax
inc counter
jmp A
A2:
cmp counter,0
jle exit
pop ax
dec counter

mov dx,multiplier
imul dx
add tmp,ax

mov ax,multiplier
mov dx,10
imul dx
mov multiplier,ax
jmp A2

exit:
mov ax,tmp
mov multiplier,1
mov tmp,0
ret
getNumToAX ENDP
