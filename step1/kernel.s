.code16

mov $msg, %bx 
call print

jmp .

msg: .ascii "AAAA\0"

.section .data
  .word 0xaa55
