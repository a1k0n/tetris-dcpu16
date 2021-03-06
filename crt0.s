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


  .globl memcpyb
:memcpyb
  IFU C, 0 ; zero or negative size -> return
    SET PC, POP
  SET PUSH, I
  SET PUSH, J
  SET J, A
  SET I, B
  SET B, C
  SUB C, 1
  SUB A, 1
  ADD J, C ; J is now the last dest address
  ADD I, C ; I is now the last src address
  AND B, 7
  MUL B, -1
  ADD B, 8 ; B is 8-len&7
  ADD PC, B ; jump into table below
  STD [J], [I]
  STD [J], [I]
  STD [J], [I]
  STD [J], [I]
  STD [J], [I]
  STD [J], [I]
  STD [J], [I]
  STD [J], [I]
  IFN J, A
    SUB PC, 10 ; PC-10 is the loop above
  SET J, POP
  SET I, POP
  SET PC, POP


  .globl keyboard_scan
:keyboard_scan
  SET B, A
  SET A, 2
  HWI [_hw_keyboard]
  SET A, C
  SET PC, POP

  .globl keyboard_getch
:keyboard_getch
  SET A, 1
  HWI [_hw_keyboard]
  SET A, C
  SET PC, POP

  .globl clock_init
:clock_init
  SET B, A
  SET A, 0
  HWI [_hw_clock]
  SET PC, POP

  .globl clock_get_ticks
:clock_get_ticks
  SET A, 1
  HWI [_hw_clock]
  SET A, C
  SET PC, POP

        .section        data,"w"
        .globl _hw_screen, _hw_clock, _hw_keyboard
:_hw_screen
  .short 0
:_hw_clock
  .short 0
:_hw_keyboard
  .short 0

