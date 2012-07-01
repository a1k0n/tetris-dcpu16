include config.mk
# You need llvm, clang, and binutils to build this.  Follow the instructions on
# the README at http://github.com/llvm-dcpu16/llvm-dcpu16
# binutils is available at http://github.com/frot/binutils-dcpu16
CLANG = $(LLVM_DIR)/bin/clang
GAS = $(BINUTILS_DIR)/gas/as-new
LD = $(BINUTILS_DIR)/ld/ld-new

CFLAGS = -Wall -O2

OBJS = crt0.o tetris.o

all: tetris.bin

dump: tetris.bin comments.s
	@cat comments.s
	@python dumpdat.py tetris.bin

tetris.bin: $(OBJS)
	$(LD) -o $@ $(OBJS)

%.o: %.s
	$(GAS) -o $@ $<

%.o: %.cc
	$(CLANG) -S $(CFLAGS) -target dcpu16 $< -o $(patsubst %.o,%.s,$@)
	$(GAS) -o $@ $(patsubst %.o,%.s,$@)

clean::
	rm -f tetris.s tetris.bin *.o
