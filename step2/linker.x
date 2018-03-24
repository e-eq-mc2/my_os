SECTIONS
{
  . = 0x7C00;
  .text : { kernel.o(.text) }
  .text : { print_str.o(.text) }
  .text : { print_hex.o(.text) }

  . = 0x7DFE;
  .boot_signature : {
    kernel.o(.boot_signature)
  }
  stack_base = (0x7C00  + 0x400);
}

