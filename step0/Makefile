CFLAGS=-c -m32 
LDFLAGS=-nostartfiles -nostartfiles --verbose -nostdlib --oformat=binary -Ttext=0x0 --build-id=none
CC=i386-elf-gcc
LD=i386-elf-ld
RUN=qemu-system-i386
RFLAGS=-nographic
LDSCRIPT=linker.x

TARGET=kernel.img
OBJS=kernel.o

.PHONY: clean

.s.o:
	$(CC) $(CFLAGS) $< -o $@

$(TARGET): $(OBJS) Makefile $(LDSCRIPT)
	$(LD) $(LDFLAGS) $(OBJS) -o $@ -T $(LDSCRIPT)

clean:
	rm -f *.o

run: $(TARGET)
	#$(RUN) $(RFLAGS) -drive file=$<,format=raw
	$(RUN) $(RFLAGS) $<
