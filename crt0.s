; note: you must compile with -fno-builtin
  .text
  .globl _init
:_init
  HWN J
:_crt0_init_hw
  SUB J, 1
  HWQ J
  IFE B, 0x7349
    IFE A, 0xF615
    SET [_hw_screen], J
  IFE B, 0x30CF
    IFE A, 0x7406
    SET [_hw_keyboard], J
  IFE B, 0x12D0
    IFE A, 0xB402
    SET [_hw_clock], J
  IFN J, 0
    SET PC, _crt0_init_hw
  SET PC, main

  .globl memset
:memset
; memset(a, b, c)  -> c is 32 bit, so the actual length is on the stack
  ; SET C, PICK 1 ; <- if you compile without -fno-builtin you will need to
                  ; uncomment this but other stuff will probably break
  SET PUSH, I
  SET PUSH, J
  SET J, A
  SET I, C
  ADD C, A ; c is now the end address
  AND I, 7
  MUL I, -1
  ADD I, 8 ; i is 8-len&7
  ADD PC, I ; jump into table below
  STI [J], B
  STI [J], B
  STI [J], B
  STI [J], B
  STI [J], B
  STI [J], B
  STI [J], B
  STI [J], B
  IFN J, C
    SUB PC, 10 ; PC-10 is the loop above
  SET J, POP
  SET I, POP
  SET PC, POP

        .section        data,"w"
        .globl _hw_screen, _hw_clock, _hw_keyboard
:_hw_screen
  .short 0
:_hw_clock
  .short 0
:_hw_keyboard
  .short 0

