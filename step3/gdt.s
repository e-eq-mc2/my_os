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
gdt_descriptor:
.word (gdt_end - gdt_start)
.int gdt_start
