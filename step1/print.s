.code16
.global print

print:
  mov $0x0e, %ah

loop_begin:
  cmpb $0x0, (%bx)
  je loop_end
  mov (%bx), %al
  int $0x10
  add $0x1, %bx
  jmp loop_begin
loop_end:
  ret
