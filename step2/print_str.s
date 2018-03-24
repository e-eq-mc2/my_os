.code16
.global print_str

print_str:
push %bp
mov %sp, %bp

push %ax
push %bx

mov 4(%bp), %bx

loop_begin:

cmpb $0x0, (%bx)
je loop_end

movb (%bx), %al
movb $0x0e, %ah
int $0x10
add $0x1, %bx
jmp loop_begin

loop_end:

pop %bx
pop %ax

mov %bp, %sp
pop %bp
ret
