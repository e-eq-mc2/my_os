.code16 
start:
cli # Clear Interrupt Flag

mov $stack_base, %bp
mov %bp, %sp

call setup_gdt

.code32
mov $0xB8000, %ebx
mov $64, %ecx

l0:
movb $'A', %al
movb $0x04, %ah
movw %ax, (%ebx)

add $2, %ebx
loop l0

jmp .

.section .boot_signature, "a"
.word 0xaa55
