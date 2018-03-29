.code16
start:
cli # Clear Interrupt Flag

lgdtl (gdt_descriptor)

movl %cr0,%eax
orl  $0x01,%eax
movl %eax,%cr0
jmp  flash_pipeline

flash_pipeline:
movw $16, %ax
movw %ax, %ds
movw %ax, %es
movw %ax, %fs
movw %ax, %gs
movw %ax, %ss

ljmp $8, $start_32bit

.code32
start_32bit:

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
