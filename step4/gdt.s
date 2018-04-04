.code16
#### GDT ####
.section .gdt, "a"
.align 8
gdt_start:
.quad 0x0

# https://wiki.osdev.org/Global_Descriptor_Table
segment_descriptor_code: 
.word 0xffff # Limit 0:15
.word 0x0000 # Base 0:15
.byte 0x00 # Base 16:23
.byte 0b10011010 # Access Byte [Pr(1)][Privl(2)][1(1)][Ex(1)][DC(1)][RW(1)][0(1)]
.byte 0b11001111 # Limit 16:19, Flags [Gr(1)][Sz(1)][0(1)][0(1)]
.byte 0x00 # Base 24:31

segment_descriptor_data: 
.word 0xffff
.word 0x0000
.byte 0x00
.byte 0b10010010
.byte 0b11001111
.byte 0x00

gdt_end:

.global gdt_descriptor
gdt_descriptor: # GDT descriptor which will be stored to GDTR
.word (gdt_end - gdt_start - 1) 
.int gdt_start
# https://en.wikibooks.org/wiki/X86_Assembly/Global_Descriptor_Table
# LIMIT is the size of the GDT, and BASE is the starting address. LIMIT is 1 less than the length of the table, so if LIMIT has the value 15, then the GDT is 16 bytes long.

.set CODE_SEGMENT_OFFSET, segment_descriptor_code - gdt_start
.set DATA_SEGMENT_OFFSET, segment_descriptor_data - gdt_start
#### ### ####

.global setup_gdt
setup_gdt:

lgdtl (gdt_descriptor)

movl %cr0,%eax
orl  $0x1,%eax
movl %eax,%cr0

# Far jump to code segment
# This far jump make CPU flush its cache of pre-fetched and real-mode decoded instructions, 
# which can cause problems
# And cs and eip is automatically set with the far address which is specified as operand of jmp
ljmp $CODE_SEGMENT_OFFSET, $start_32bit

start_32bit:

mov $DATA_SEGMENT_OFFSET, %ax
mov %ax, %ds
mov %ax, %es
mov %ax, %fs
mov %ax, %gs
mov %ax, %ss

ret
