org 100h

.data
a dw -1
b dw -9
f db 0
result dw 0

.code
mov ax,a
mov bx,b
cmp ax,bx

jl lower
jg higher

;a = b
mov ax,-2
mov [result],ax
jmp short exit

;a < b
lower:
cmp ax,0
je error
sub ax,bx
mov bx,a
cwd
idiv bx
mov [result],ax
jmp short exit

;a > b
higher:
cmp bx,-1
je error
cwd
idiv bx
inc ax
mov [result],ax
jmp short exit

;/0
error:
mov f,1
ret

exit:
ret
