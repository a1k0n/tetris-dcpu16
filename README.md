# DCPU-16 Tetris

It's Tetris.  For DCPU-16.  Written in C++, in order to stress-test the
LLVM/Clang toolchain.  Amazingly, it works (after working around several
outstanding issues).

### Building

You need llvm, clang, and binutils to build this.  Follow the
instructions on the README at
http://github.com/llvm-dcpu16/llvm-dcpu16

binutils is available at http://github.com/frot/binutils-dcpu16

Copy config.mk.template to config.mk and update your paths as necessary, then
type `make` to build.  This produces a binary image `tetris.bin` which could in
theory be loaded into the official emulator (but I haven't tried it).

`make dump` (requires python) will generate a pastable list of DAT statements
suitable for http://dcpu.ru or http://0x10co.de so that's what I use.

### Controls:
    Q   E - rotate left/right
      W   - immediate drop (you can still slide afterwards)
    A   D - move left/right
      S   - fall one space

Arrow keys and space also work, but javascript emulators currently have
issues with arrow key and space key handling.

### TODO:
 - detect game over (easy)
 - canonical score - bonus points for double/triple/tetris/combos/etc
 - "levels" and speeding up
 - redraw screen character-at-a-time, not block-at-a-time
 - better key repeat logic, esp. for down
maybe:
 - ghost display
 - wall kicks/etc
mmmmmaybe:
 - t-spins?  or do they already work?
 - hold piece

It would be fairly easy to make a multiplayer version of this, as long as both
players were using the same keyboard.

See BUGS.md for a list of bugs in other programs I found while writing this.  I
will be submitting patches, but needed a place to keep track of the myriad
issues.

Patches are welcome!  Please fork and send pull requests.

