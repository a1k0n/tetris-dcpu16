### keyboard spec bugs
 - you must poll each key you're interested in for key-up events on interrupt.
   this is dumb.  key-up events should be queued.

### dcpu.ru bugs
 - screen.MEM\_DUMP\_\* unimplemented
 - screen.MEM\_MAP\_FONT(0) does not restore default font
 - non-arrow keys aren't included in `pressed` array (see my patches for ref)
 - down arrow key queuing doesn't work?

### 0x10co.de bugs
 - arrow keys do not get buffered at all

### llvm-dcpu16 bugs
 - internal compiler errors if we try to use the fancy line clear animation.

### llvm-dcpu16 <-> binutils-dcpu16 interaction bugs
 - weak sections (e.g. from C++ inline instantiations) don't work
   workaround: avoid generating them by using anonymous namespaces

