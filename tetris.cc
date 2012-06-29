#include "crt0.h"

// TODO:
//  - canonical score - bonus points for double/triple/tetris/combos/etc
//  - detect game over
//  - blit character-at-a-time, not block-at-a-time
//  - better key repeat logic, esp. for down
//  - logo w/ press key to start to init RNG
//  - instructions
// maybe:
//  - ghost display
//  - wall kicks/etc
// mmmmmaybe:
//  - t-spins?  or do they already work?
//  - hold piece

// Tetris guidelines: Playfield is 10 cells wide and at least 22 cells tall,
// where rows above 20 are hidden or obstructed by the field frame
// The I and O spawn in the middle columns
// The rest spawn in the left-middle columns
static const int playfield_width = 10;
static const int startoffs_x = 3;
static const int playfield_height = 23;
static const int center_offset = (32 - playfield_width)/2;

template<class T> T min(T a, T b) { if(a<b) return a; return b; }
template<class T> T max(T a, T b) { if(a>b) return a; return b; }

static int toupper(int c) {
  if(c >= 'a' && c <= 'z')
    return c - 32;
  return c;
}

static inline void screen_set_frameptr(void *ptr) {
  asm("SET\tB,%1\n\tSET\tA,0\n\tHWI %0" : : "g"(_hw_screen), "r"(ptr) : "A", "B");
}

static inline void screen_set_fontptr(void *ptr) {
  asm("SET\tB,%1\n\tSET\tA,1\n\tHWI %0" : : "g"(_hw_screen), "r"(ptr) : "A", "B");
}

static struct Tetromino {
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

namespace {

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
    int lo = left_offset_;
    // draw bottom of well
    for(unsigned x = 0; x < playfield_width;x++) {
      screen_[lo + 11*32 + x] = 0x901c;
    }
    // sides of well
    for(unsigned y = 0; y <= playfield_height/2;y++) {
      screen_[lo-1 + y*32] = 0x9900;
      screen_[lo+playfield_width + y*32] = 0x9900;
    }
#if 0
    // the next piece box just looks dumb, forget it
    // next piece box
    for(unsigned x = 1; x < 8; x++) {
      screen_[lo+playfield_width + x] = 0x901c;
      screen_[lo+playfield_width + x + 3*32] = 0x091c;
    }
    screen_[lo+playfield_width + 7 + 1*32] = 0x991c;
    screen_[lo+playfield_width + 7 + 2*32] = 0x991c;
#endif
    screen_[lo+playfield_width + 2 + 32] = 'N'|0xf000;
    screen_[lo+playfield_width + 3 + 32] = 'e'|0xf000;
    screen_[lo+playfield_width + 4 + 32] = 'x'|0xf000;
    screen_[lo+playfield_width + 5 + 32] = 't'|0xf000;
    screen_[lo - 7 + 32] = 'L'|0xf000;
    screen_[lo - 6 + 32] = 'i'|0xf000;
    screen_[lo - 5 + 32] = 'n'|0xf000;
    screen_[lo - 4 + 32] = 'e'|0xf000;
    screen_[lo - 3 + 32] = 's'|0xf000;
    speed_ = 30;
    ticks_ = 0;
    score_ = lines_ = 0;
    rand_state_ = 0x6531;
    ShufflePieces();
    next_piece_idx_ = 0;
    NextPiece();
    DrawScore();
  }

  // "inside-out" Fisher-Yates shuffle
  void ShufflePieces() {
    piece_permutation_[0] = 0;
    for(unsigned i=1;i<7;i++) {
      int j = Random()%i;
      piece_permutation_[i] = piece_permutation_[j];
      piece_permutation_[j] = i;
    }
#if 0
    // debug: show shuffle order on the screen
    for(unsigned i=0;i<7;i++)
      screen_[i] = 0x0f30 + piece_permutation_[i];
#endif
  }

  void DrawScore() {
    int lo = left_offset_ + 2*32;
    int l = lines_;
    for(int n=0;n<5;n++) {
      screen_[lo - 3 - n] = l%10 + 0xf000 + '0';
      l /= 10;
    }
  }

  void DrawNextPiece(int piece) {
    // this is custom piece-drawing code, ugh
    unsigned c = tetris_pieces[piece].color;
    unsigned shape = tetris_pieces[piece].shape[0];
    int lo = left_offset_ + playfield_width + 2 + 2*32;
    // All pieces fit into two rows in the initial orientation
    for(unsigned i=0;i<4;i++) {
      unsigned c1 = shape&0x8000 ? (c<<8) : 0;
      unsigned c2 = shape&0x0800 ? (c<<12) : 0;
      screen_[lo + i] = 0x1c | c1 | c2;
      shape <<= 1;
    }
  }

  void NextPiece() {
    current_piece_ = piece_permutation_[next_piece_idx_];
    current_color_ = tetris_pieces[current_piece_].color;
    next_piece_idx_++;
    if(next_piece_idx_ == 7) {
      ShufflePieces();
      next_piece_idx_ = 0;
    }
    piece_x_ = startoffs_x;
    piece_y_ = -1;
    piece_rot_ = 0;
    DrawNextPiece(piece_permutation_[next_piece_idx_]);
  }

  void Update(int ticks) {
    ticks_ += ticks;
    // changing this if to while crashes the compiler
    if(ticks_ > speed_) {
      ticks_ -= speed_;
      Drop();
    }
  }

  unsigned Random() {
    rand_state_ *= 16807;
    if(rand_state_ > 2147483647UL) rand_state_ -= 2147483647;
    return rand_state_&65535;
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
      for(unsigned i=0;i<4;i++, playfield_offset++, piece_data <<= 1,
          playfield_x++) {
        if(piece_data&0x8000 &&
           playfield_x >= 0 &&
           playfield_x < playfield_width &&
           playfield_offset >= 0 &&
           playfield_offset < playfield_width*playfield_height) {
          playfield_[playfield_offset] = color;
        }
      }
    }
  }

  bool CheckPieceCollision() {
    int playfield_offset = piece_y_*playfield_width + piece_x_;
    unsigned piece_data = tetris_pieces[current_piece_].shape[piece_rot_];
    for(int j=0;j<4;j++, playfield_offset += (playfield_width - 4)) {
      for(int i=0;i<4;i++, playfield_offset++, piece_data <<= 1) {
        if(piece_data&0x8000) {
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

  bool IsLineFull(int lineno) {
    int offs = lineno*playfield_width;
    for(int i=0;i<playfield_width;i++) {
      if(playfield_[offs + i] == 0)
        return false;
    }
    return true;
  }

  void CheckLines() {
    //unsigned lines[playfield_height];
    unsigned nlines = 0;
    for(int j=playfield_height-1;j>=0;j--) {
      if(IsLineFull(j)) {
        //lines[nlines++] = j;
        nlines ++;
        lines_ ++;
        memcpyb(playfield_ + playfield_width, playfield_, j*playfield_width);
        memset(playfield_, 0, playfield_width);
        BlitPlayfield(0, playfield_height);
        j++;
      }
    }
    if(nlines) {
      // TODO: determine scores for single, double, triple, tetris, combos, etc
      DrawScore();
    }
#if 0
    for(int k=0;k<nlines;k++) {
      unsigned offs = lines[k]*playfield_width;
      memset(playfield_ + offs, 0, 10);
    }
      // animate clearing them, then drop everything
      for(int i=0;i<5;i++) {
        for(int k=0;k<nlines;k++) {
          int offs = lines[k]*10 + 5;
          playfield_[offs - 1 - i] = 0;
          playfield_[offs + i] = 0;
          //playfield_[0] = 0;
        }
        BlitPlayfield(0, playfield_height);
      }
#endif
  }

  void Drop() {
    // remove piece from buf
    DrawPiece(0);
    // drop the piece by 1
    piece_y_++;
    if(CheckPieceCollision()) {
      piece_y_ --;
      DrawPiece(current_color_);
      BlitPlayfield(max(0, piece_y_-1), min(23,piece_y_+4));
      CheckLines();
      NextPiece();
      return;
    }
    // if(piece_y_ > 28) piece_y_ = -4;
    //current_piece_ ++; current_piece_ %= 7;
    // collision-detect
    // if collision, put piece back where it was in the buf and NextPiece()
    // if clear, draw piece into buf at new location and BlitPlayfield()
    DrawPiece(current_color_);
    BlitPlayfield(max(0, piece_y_-1), min(23,piece_y_+4));
  }

  void Move(int dir) {
    DrawPiece(0);
    piece_x_ += dir;
    if(CheckPieceCollision()) {
      piece_x_ -= dir;
      DrawPiece(current_color_);
    } else {
      DrawPiece(current_color_);
      BlitPlayfield(max(0, piece_y_), min(23,piece_y_+4));
    }
  }

  void Rotate(int dir) {
    DrawPiece(0);
    piece_rot_ += dir;  piece_rot_ &= 3;
    if(CheckPieceCollision()) {
      piece_rot_ -= dir;  piece_rot_ &= 3;
      DrawPiece(current_color_);
    } else {
      DrawPiece(current_color_);
      BlitPlayfield(max(0, piece_y_), min(23,piece_y_+4));
    }
  }

 private:
  unsigned* screen_;
  unsigned current_piece_, next_piece_idx_;
  unsigned piece_permutation_[7];
  unsigned current_color_;
  int piece_x_, piece_y_, piece_rot_;
  unsigned left_offset_;
  int speed_, ticks_;
  unsigned long score_, lines_;
  unsigned long rand_state_;
  unsigned playfield_[playfield_width*playfield_height];
};

}

int main()
{
  // alloc screen, playfield
  unsigned screen[384];
  // xxx<12>yy<12>zzz
  // xxx+yy+zzz = 8
  Tetris t(center_offset, screen);
  //Tetris t1(4, screen);
  //Tetris t2(4+12+2, screen);

  // TODO: update font (later -- for now, use 0x1c)
  //memset(screen_, 0, sizeof(screen_));
  screen_set_frameptr(screen);

  clock_init(1);
  t.Init();
  //t.Scramble();
  t.BlitPlayfield(0, playfield_height);
  int ticks = clock_get_ticks();
  for(;;) {
    int newt = clock_get_ticks();
    int dt = newt - ticks;
    t.Update(dt);
    switch(toupper(keyboard_getch())) {
      case 'A':
      case 0x82: // left
        t.Move(-1);
        break;
      case 'D':
      case 0x83: // right
        t.Move(1);
        break;
      case 'W':
      case 0x80: // up
      case ' ':
      case 'E':
        t.Rotate(1);
        break;
      case 'Q':
        t.Rotate(-1);
        break;
      case 'S':
        t.Drop();
        break;
    }
#if 0
    unsigned input = 0;
    // this keyboard API is utterly silly
    input |= keyboard_scan(0x82)<<0; // left
    input |= keyboard_scan('A')<<0;  // left
    input |= keyboard_scan(0x83)<<1; // right
    input |= keyboard_scan('D')<<1;  // right
    input |= keyboard_scan(0x80)<<2; // up
    input |= keyboard_scan('W')<<2;  // up
    input |= keyboard_scan(0x81)<<3; // down
    input |= keyboard_scan('S')<<3;  // down
    input |= keyboard_scan(' ')<<4;  // rotate right
    input |= keyboard_scan('E')<<4;
    input |= keyboard_scan('Q')<<5;  // rotate left
    screen[0] = 0xf030 + input;
#endif
    ticks = newt;
  }
}

