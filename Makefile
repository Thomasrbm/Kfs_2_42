ASM_SOURCES := $(shell find srcs -name '*.s')
C_SOURCES := $(shell find srcs -name '*.c')

OBJS := $(patsubst srcs/%.s, objs/%.o, $(ASM_SOURCES))
OBJS += $(patsubst srcs/%.c, objs/%.o, $(C_SOURCES))

objs/%.o: srcs/%.s
	@mkdir -p $(dir $@)
	nasm -f elf32 $< -o $@

objs/%.o: srcs/%.c
	@mkdir -p $(dir $@)
	gcc -m32 -c $< -o $@ -ffreestanding -fno-builtin -fno-exceptions -fno-stack-protector -nostdlib -nodefaultlibs

build-x86_64: $(OBJS)
	mkdir -p distro/x86_64 && \
	ld -m elf_i386 -n -o distro/x86_64/kernel.bin -T targets/linker.ld $(OBJS) && \
	cp distro/x86_64/kernel.bin targets/iso/boot/kernel.bin && \
	grub-mkrescue /usr/lib/grub/i386-pc -o distro/x86_64/kernel.iso targets/iso

run:
	env -i PATH=/usr/bin:/bin HOME=$(HOME) DISPLAY=$(DISPLAY) XAUTHORITY=$(XAUTHORITY) qemu-system-i386 -cdrom distro/x86_64/kernel.iso

fclean:
	rm -rf objs/ distro/
	rm -f targets/iso/boot/kernel.bin

re: fclean build-x86_64

.PHONY: build-x86_64 run fclean re