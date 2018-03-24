.code16
.global print_hex

print_hex:
push %bp
mov %sp, %bp

push %ax
push %bx
push %cx
push %si

push $hex_prefix
call print_str

mov $4, %cx
loop_begin:
push %cx

mov %cx, %bx
lea -1(%bx), %cx
shl $2, %cx

mov 4(%bp), %si
shr %cl, %si
and $0xf, %si

movb hex_char(%si), %al
movb $0x0e, %ah
int $0x10

pop %cx
loop loop_begin

push $hex_postfix
call print_str

pop %si
pop %cx
pop %bx
pop %ax

mov %bp, %sp
pop %bp
ret

hex_prefix: .ascii "0x\0"
hex_char: .ascii "0123456789abcdef"
hex_postfix: .ascii "\n\r\0"
