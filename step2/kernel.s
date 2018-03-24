.code16

start:
mov $stack_base, %bp
mov %sp, %bp

push $msg 
call print_str

push $(start + 1024)
call print_hex

push $stack_base
call print_hex

jmp .

msg: .ascii "Hello world!\r\n\0"

.section .boot_signature, "a"
  .word 0xaa55
