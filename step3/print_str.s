.code32

.global print_str
print_str:
push %ebp
mov %esp, %ebp

push %edi
push %edx
push %eax

mov  8(%ebp), %edx
mov 12(%ebp), %edi

loop_begin:

cmpb $0x0, (%edx)
je loop_end

movb (%edx), %al
movb $0x04, %ah
movw %ax, (%edi)

add $0x1, %edx
add $0x2, %edi

jmp loop_begin
loop_end:

pop %eax
pop %edx
pop %edi

mov %ebp, %esp
pop %ebp
ret
