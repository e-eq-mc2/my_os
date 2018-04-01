.code16 
start:
cli # Clear Interrupt Flag

mov $stack_base, %bp
mov %bp, %sp

call setup_gdt
.code32

push $msg
call print_str
add $4, %esp

push $0x00112233
call print_hex
add $4, %esp

push $0x44556677
call print_hex
add $4, %esp

push $0x8899aabb
call print_hex
add $4, %esp

push $0xccddeeff
call print_hex
add $4, %esp

jmp .

msg: .ascii "Hello World!\r\n\0"

.section .boot_signature, "a"
.word 0xaa55
