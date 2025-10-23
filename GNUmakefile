.SUFFIXES:

OUTPUT := acrix_os

V := v
VFLAGS := -cross -d no_backtrace -nofloat -manualfree -freestanding -no-builtin -no-std -is_o -gc none -m64 -cc clang -o

NASMFLAGS := -f elf64 -g -F dwarf

LD := ld
LDFLAGS := -m elf_x86_64 -nostdlib -static -z max-page-size=0x1000 --gc-sections -T linker.ld

SRCFILES := $(shell find . -type f)
VFILES := $(filter %.v,$(SRCFILES))
ASMFILES := $(filter %.asm,$(SRCFILES))
OBJ := $(addprefix obj/,$(VFILES:.v=.v.o) $(ASMFILES:.asm=.asm.o))

.PHONY: all
all: bin/$(OUTPUT)

bin/$(OUTPUT): $(OBJ)
	mkdir -p $(dir $@)
	$(LD) $(LDFLAGS) $^ -o $@

obj/%.v.o: %.v
	mkdir -p $(dir $@)
	$(V) $(VFLAGS) $@ $<

obj/%.asm.o: %.asm
	mkdir -p $(dir $@)
	nasm $(NASMFLAGS) $< -o $@

.PHONY: clean
clean:
	rm -rf obj bin