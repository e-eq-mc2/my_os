.code32

.global print_str
print_str:
push %ebp
mov %esp, %ebp

push %edi
push %edx
push %eax
push %ecx

mov  8(%ebp), %edx

loop_begin:

# Check /0
cmpb $0x0, (%edx)
je loop_end

# Check /r
cmpb $'\r', (%edx)
je carriage_return

# Check /n
cmpb $'\n', (%edx)
je line_feed

jmp check_overrun

#####
carriage_return:
movl $0x0, (cursor_position_x)
jmp check_overrun

line_feed:
incl (cursor_position_y)
jmp check_overrun

####
check_overrun:
check_overrun_x:
cmpl $80, (cursor_position_x)
jl check_overrun_y

overrun_x:
movl $0x0, (cursor_position_x)
incl (cursor_position_y)

check_overrun_y:
cmpl $25, (cursor_position_y)
jl print_char

overrun_y:
movl $0x0, (cursor_position_y)

####
print_char:
#mov (cursor_position_y), %eax
#mov $80, %ecx
#mulw %cx

mov $0, %eax
add (cursor_position_x), %eax

#mov $2, %ecx
#mulw %cx
shl %eax

mov %eax, %edi 

movb (%edx), %al
movb $0x04, %ah
movw %ax, 0xb8000(%edi)

inc %edx
incl (cursor_position_x)

jmp loop_begin
loop_end:

pop %ecx
pop %eax
pop %edx
pop %edi

mov %ebp, %esp
pop %ebp
ret

cursor_position_x: .int 0x0
cursor_position_y: .int 0x0
