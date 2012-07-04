#ifdef __cplusplus
extern "C" {
#endif
extern void *memset(void* b, int c, unsigned len);
// backward memcpy (i was too lazy to implement proper memmove)
extern void *memcpyb(void* b, void* a, unsigned len);

// initialized by crt0
extern int _hw_screen, _hw_clock, _hw_keyboard;

extern int keyboard_scan(int key);
extern int keyboard_getch();

inline void screen_set_frameptr(void *ptr) {
  asm("SET\tB,%1\n\tSET\tA,0\n\tHWI %0" : : "g"(_hw_screen), "r"(ptr) : "A", "B");
}

inline void screen_set_fontptr(void *ptr) {
  asm("SET\tB,%1\n\tSET\tA,1\n\tHWI %0" : : "g"(_hw_screen), "r"(ptr) : "A", "B");
}

inline void screen_set_paletteptr(void *ptr) {
  asm("SET\tB,%1\n\tSET\tA,2\n\tHWI %0" : : "g"(_hw_screen), "r"(ptr) : "A", "B");
}

inline void screen_dump_font(void *ptr) {
  asm("SET\tB,%1\n\tSET\tA,4\n\tHWI %0" : : "g"(_hw_screen), "r"(ptr) : "A", "B");
}

inline void screen_dump_palette(void *ptr) {
  asm("SET\tB,%1\n\tSET\tA,5\n\tHWI %0" : : "g"(_hw_screen), "r"(ptr) : "A", "B");
}

extern void clock_init(int period);
extern int clock_get_ticks();

#ifdef __cplusplus
}
#endif

