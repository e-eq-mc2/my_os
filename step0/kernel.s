.code16

mov $0x0e, %ah
mov $0x41, %al
int $0x10

jmp .

.org    510
.word 0xaa55
