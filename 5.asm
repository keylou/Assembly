org 100h

.data
arr dw -5, -2, -1, 0
c dw -5
d dw 2
Sum dw 0
counter db 0
celoe db 0

.code
main proc

mov cx,4
lea si, arr

compare:
mov ax, c
mov dx, d
imul dx
mov dx,ax
cmp word ptr [si], dx
jl skip
cmp word ptr [si], 0
jg skip
mov ax, word ptr [si]
imul word ptr [si]
imul word ptr [si]
add Sum, ax
skip:
add si, 2
loop compare

;need to output result to console

mov ax,Sum
mov dx,-1
imul dx
mov bl,10
B:
cmp ax,0
jle B3
idiv bl
mov celoe,al
xchg al,ah
cbw
push ax
inc counter
mov al,celoe
cbw
jmp B

B3:
mov dl, '-'
mov ah,2
int 21h

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

main endp
ret
