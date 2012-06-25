#include "crt0.h"

// Tetris guidelines: Playfield is 10 cells wide and at least 22 cells tall,
// where rows above 20 are hidden or obstructed by the field frame
// The I and O spawn in the middle columns
// The rest spawn in the left-middle columns
static const unsigned playfield_width = 10;
static const unsigned startoffs_x = 3;
static const unsigned playfield_height = 23;
static const unsigned center_offset = (32 - playfield_width)/2;

template<class T> T min(T a, T b) { if(a<b) return a; return b; }
template<class T> T max(T a, T b) { if(a>b) return a; return b; }

static inline void screen_set_frameptr(void *ptr) {
  asm("SET\tB,%1\n\tSET\tA,0\n\tHWI %0" : : "g"(_hw_screen), "r"(ptr) : "A", "B");
}

static inline void screen_set_fontptr(void *ptr) {
  asm("SET\tB,%1\n\tSET\tA,1\n\tHWI %0" : : "g"(_hw_screen), "r"(ptr) : "A", "B");
}

struct Tetromino {
  unsigned color;
  unsigned shape[4];  // the shape as a 4x4 bitmap, in each orientation
  // MSB on the left, most significant nibble at the top
} tetris_pieces[7] = {
// Tetris guidelines:
// The tetrominoes spawn horizontally and with their flat side pointed down.
// Cyan I
  {11,  /* color */
    {0x0f00, 0x2222, 0x00f0, 0x4444},
  },
// Yellow O
  {14,
    {0x6600, 0x6600, 0x6600, 0x6600},
  },
// Purple T
  {5,
    {0x4e00, 0x4640, 0x0e40, 0x4c40},
  },
// Green S
  {10,
    {0x6c00, 0x4620, 0x06c0, 0x8c40},
  },
// Red Z
  {9,
    {0xc600, 0x2640, 0x0c60, 0x4c80},
  },
// Blue J
  {1,
    {0x8e00, 0x6440, 0x0e20, 0x44c0},
  },
// Orange L
  {6,
    {0x2e00, 0x4460, 0x0e80, 0xc440},
  }
};

class Tetris
{
 public:
  Tetris(unsigned x_offset, unsigned *screen):
    screen_(screen),
    left_offset_(x_offset)
  {
  }

  void Init() {
    // these are already clear on any reasonable emulator but w/e
    memset(playfield_, 0, sizeof(playfield_));
    // bottom border
    for(unsigned x = 0; x < playfield_width;x++) {
      screen_[center_offset + 11*32 + x] = 0x901c;
    }
    for(unsigned y = 0; y <= playfield_height/2;y++) {
      screen_[center_offset-1 + y*32] = 0x9900;
      screen_[center_offset+playfield_width + y*32] = 0x9900;
    }
    speed_ = 2000;
    rand_state_ = 0x6531;
    next_piece_ = RandomPiece();
    NextPiece();
  }

  void NextPiece() {
    current_piece_ = next_piece_;
    next_piece_ = RandomPiece();
    piece_x_ = startoffs_x;
    piece_y_ = 0;
    piece_rot_ = 0;
  }

  void Delay() {
    volatile unsigned ctr = speed_;
    while(ctr) ctr--;
  }

  unsigned RandomPiece() {
    rand_state_ *= 0xf837;
    rand_state_ -= 8212;
    return rand_state_ % 7;
  }

#if 0
  void Scramble() {
    for(unsigned j = 0; j < playfield_height; j++) {
      for(unsigned i = 0; i < playfield_width; i++) {
        playfield_[i+j*playfield_width] = piece_color[RandomPiece()];
      }
    }
  }
#endif

  void Input(unsigned key) {
  }

  // draws playfield from [minrow,maxrow) -- that is, maxrow-minrow rows, not
  // including maxrow.
  void BlitPlayfield(unsigned minrow, unsigned maxrow) {
    for(unsigned j = minrow; j < maxrow; j++) {
      unsigned screen_idx = (j>>1)*32 + left_offset_;
      for(unsigned i = 0; i < playfield_width; i++, screen_idx++) {
        unsigned color = playfield_[i+j*playfield_width];
        if(j&1)
          screen_[screen_idx] = (screen_[screen_idx] & 0x0f00) | (color<<12)|0x1c;
        else
          screen_[screen_idx] = (screen_[screen_idx] & 0xf000) | (color<<8)|0x1c;
      }
    }
  }

  void DrawPiece(unsigned color) {
    int playfield_offset = piece_y_*playfield_width + piece_x_;
    unsigned piece_data = tetris_pieces[current_piece_].shape[piece_rot_];
    for(unsigned j=0;j<4;j++, playfield_offset += (playfield_width - 4)) {
      int playfield_x = piece_x_;
      for(unsigned i=0;i<4;i++, playfield_offset++) {
        if(playfield_x >= 0 && playfield_x < playfield_width &&
           playfield_offset >= 0 &&
           playfield_offset < playfield_width*playfield_height) {
          if(piece_data&(0x8000>>(i+4*j))) {
            playfield_[playfield_offset] = color;
          }
        }
      }
    }
  }

  bool CheckPieceCollision() {
    int playfield_offset = piece_y_*playfield_width + piece_x_;
    unsigned piece_data = tetris_pieces[current_piece_].shape[piece_rot_];
    for(int j=0;j<4;j++, playfield_offset += (playfield_width - 4)) {
      for(int i=0;i<4;i++, playfield_offset++) {
        if(piece_data&(0x8000>>(i+4*j))) {
          if(piece_x_ + i < 0) return true;
          if(piece_x_ + i >= playfield_width) return true;
          if(piece_y_ + j < 0) continue;
          if(piece_y_ + j >= playfield_height) return true;
          if(playfield_[playfield_offset])
            return true;
        }
      }
    }
    return false;
  }

  void NextFrame() {
    // remove piece from buf
    DrawPiece(0);
    // drop the piece by 1
    piece_rot_ ++;  piece_rot_ &= 3;
    if(CheckPieceCollision()) {
      piece_rot_ --;  piece_rot_ &= 3;
    }
    piece_y_++;
    if(CheckPieceCollision()) {
      piece_y_ --;
      DrawPiece(tetris_pieces[current_piece_].color);
      BlitPlayfield(max(0, piece_y_-1), min(23,piece_y_+4));
      NextPiece();
      return;
    }
    // if(piece_y_ > 28) piece_y_ = -4;
    //current_piece_ ++; current_piece_ %= 7;
    // collision-detect
    // if collision, put piece back where it was in the buf and NextPiece()
    // if clear, draw piece into buf at new location and BlitPlayfield()
    DrawPiece(tetris_pieces[current_piece_].color);
    BlitPlayfield(max(0, piece_y_-1), min(23,piece_y_+4));
  }

 private:
  unsigned* screen_;
  unsigned current_piece_, next_piece_;
  int piece_x_, piece_y_, piece_rot_;
  unsigned left_offset_;
  unsigned speed_;
  unsigned rand_state_;
  unsigned playfield_[playfield_width*playfield_height];
};

int main()
{
  // alloc screen, playfield
  unsigned screen[384];
  Tetris t(center_offset, screen);

  // TODO: update font (later -- for now, use 0x1c)
  //memset(screen_, 0, sizeof(screen_));
  screen_set_frameptr(screen);

  t.Init();
  //t.Scramble();
  t.BlitPlayfield(0, playfield_height);
  for(;;) {
    t.Delay();
    t.NextFrame();
  }
}

