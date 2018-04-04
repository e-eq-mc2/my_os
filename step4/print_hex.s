.code32
.global print_hex

print_hex:
push %ebp
mov %esp, %ebp

push %ecx
push %esi
push %edi
push %edx

push $hex_prefix
call print_str
add $4, %esp

mov $(32 - 4), %ecx
mov $0, %edi
loop_begin:

mov 8(%ebp), %esi

shr %cl, %esi
and $0xf, %esi

movb hex_char(%esi), %dl
movb %dl, hex_buffer(%edi)

sub $4, %ecx
inc %edi
cmp $0, %ecx
jge loop_begin

push $hex_buffer
call print_str
add $4, %esp

push $hex_postfix
call print_str
add $4, %esp

pop %edx
pop %edi
pop %esi
pop %ecx

mov %ebp, %esp
pop %ebp
ret

.align 8
hex_prefix: .ascii "0x\0"
.align 8
hex_char: .ascii "0123456789abcdef"
hex_postfix: .ascii "\n\r\0"
hex_buffer: .ascii "01234567\0"
