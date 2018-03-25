.code16

mov $msg, %bx 
call print

jmp .

msg: .ascii "Hello World\0"

.section .boot_signature, "a"
  .word 0xaa55
