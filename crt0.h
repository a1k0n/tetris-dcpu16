#ifdef __cplusplus
extern "C" {
#endif
extern void *memset(void* b, int c, unsigned len);
// backward memcpy
extern void *memcpyb(void* b, void* a, unsigned len);

// initialized by crt0
extern int _hw_screen, _hw_clock, _hw_keyboard;

extern int keyboard_scan(int key);
extern int keyboard_getch();

extern void clock_init(int period);
extern int clock_get_ticks();

#ifdef __cplusplus
}
#endif

