.code16 
start:
cli # Clear Interrupt Flag

mov $stack_base, %bp
mov %bp, %sp

call setup_gdt
.code32

push $msg
call print_str

jmp .

msg: .ascii "Hello World!\0"

.section .boot_signature, "a"
.word 0xaa55
