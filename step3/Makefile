CFLAGS=-c -m32 
LDFLAGS=-nostartfiles -nostartfiles -nostdlib -T$(LDSCRIPT) --oformat=binary --build-id=none
CC=i386-elf-gcc
LD=i386-elf-ld
RUN=qemu-system-i386
RFLAGS=
LDSCRIPT=linker.x

TARGET=kernel.img
OBJS=kernel.o gdt.o print_str.o #print_hex.o

.PHONY: clean

.s.o:
	$(CC) $(CFLAGS) $< -o $@

$(TARGET): $(OBJS) Makefile $(LDSCRIPT)
	$(LD) $(LDFLAGS) $(OBJS) -o $@ 

clean:
	rm -f *.o *.img

run: $(TARGET)
	#$(RUN) $(RFLAGS) $< -drive format=raw,file=$<
	$(RUN) $(RFLAGS) $< -drive file=$<,format=raw,media=disk
