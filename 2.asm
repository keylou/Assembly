org 100h

.Data
a dw 5
c dw -12
d dw -17
result dw 0

.Code
mov ax,c
mov bx,4
imul bx
xchg bx,ax
mov ax,d
mov cx,2
cwd
idiv cx
xchg ax,bx
sub ax,bx
add ax,23
mov cx,ax
mov ax,a
mov bx,a
imul bx
dec ax
xchg ax,cx
cwd
idiv cx
mov [result],ax
ret
