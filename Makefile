CLANG = ~/git/llvm-dcpu16/cbuild/bin/clang
DAS = ~/git/das/das
#CFLAGS = -Wall -O3 -fno-builtin -std=c++11
CFLAGS = -Wall -O2 -fno-builtin

OBJS = crt0.s tetris.s

all: tetris.bin

dump: tetris.bin
	@python dumpdat.py tetris.bin

tetris.bin: $(OBJS)
	cat $(OBJS) | egrep -v '(\.linkonce|\.weak)' | tee crap.s | $(DAS) -o $@ -

%.s: %.cc
	$(CLANG) -S $(CFLAGS) -target dcpu16 $< -o $@

clean::
	rm tetris.s tetris.bin
