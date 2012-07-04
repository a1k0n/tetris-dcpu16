; DCPU-16 Tetris
; by andy@a1k0n.net
; Compiled from C++ using clang and llvm-dcpu16
; http://github.com/llvm-dcpu16

; Press a key to begin playing (this gives some entropy to the random number
; generator).

; Controls:
; Q   E - rotate left/right
;   W   - immediate drop (you can still slide afterwards)
; A   D - move left/right
;   S   - fall one space

; Arrow keys and space also work, but javascript emulators currently have
; issues with arrow key and space key handling.

; TODO list:
;  - less crappy title screen
;  - proper score for double/triple/tetris/combos/etc
;  - proper game over detection
;  - "level" and speeding up
;  - proper wall kicks
;  - ghost piece
;  - hold function
;  - smoother/better key repeat (uses host key repeat rate now)

