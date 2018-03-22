SECTIONS
{
  . = 0x7C00;
  .text : { kernel.o(.text) }
  .text : { print.o(.text) }

  . = 0x7DFE;
  .boot_signature : {
    KEEP(*(.boot_signature))
  }
}

