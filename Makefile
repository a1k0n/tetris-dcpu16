# You need llvm and clang to build this.  Follow the instructions on the README
# at http://github.com/llvm-dcpu16/llvm-dcpu16
CLANG = ~/git/llvm-dcpu16/cbuild/bin/clang
# You also need the das assembler (I could also have used binutils but there
# are a few bugs I'm avoiding and this is just less complicated, though it's a
# bit wonky).  http://github.com/jonpovey/das
DAS = ~/git/das/das

CFLAGS = -Wall -O2

OBJS = crt0.s tetris.s

all: tetris.bin

dump: tetris.bin comments.s
	@cat comments.s
	@python dumpdat.py tetris.bin

tetris.bin: $(OBJS)
	cat $(OBJS) | $(DAS) -o $@ -

%.s: %.cc
	$(CLANG) -S $(CFLAGS) -target dcpu16 $< -o $@

clean::
	rm tetris.s tetris.bin
