.code16

start:
mov $stack_base, %bp
mov %bp, %sp

push $msg 
call print_str

push $(start + 1024)
call print_hex
add $2, %esp

push $stack_base
call print_hex
add $2, %esp

jmp .

msg: .ascii "Hello World\r\n\0"

.section .boot_signature, "a"
  .word 0xaa55
