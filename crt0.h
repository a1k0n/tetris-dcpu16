extern "C" {
extern void *memset(void *b, int c, unsigned len);

// initialized by crt0
extern int _hw_screen, _hw_clock, _hw_keyboard;

extern int keyboard_scan(int key);
extern void clock_init(int period);
extern int clock_get_ticks();

}

