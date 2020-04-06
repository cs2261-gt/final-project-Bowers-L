# 1 "player.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "player.c"
# 1 "player.h" 1
       

# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "myLib.h"
extern unsigned short *videoBuffer;
# 85 "myLib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 157 "myLib.h"
void hideSprites();






typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} ANISPRITE;
# 200 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;





void updateInput();



extern int encoding;






typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 258 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 352 "myLib.h"
typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vBlankCount;
} SOUND;




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
int max(int a, int b);
int min(int a, int b);
# 4 "player.h" 2
# 1 "game.h" 1
       


# 1 "Spritesheet.h" 1
# 21 "Spritesheet.h"
extern const unsigned short SpritesheetTiles[16384];


extern const unsigned short SpritesheetPal[256];
# 5 "game.h" 2
# 1 "map.h" 1
# 24 "map.h"
extern const unsigned short mapTiles[496];


extern const unsigned short mapMap[4096];


extern const unsigned short mapPal[256];
# 6 "game.h" 2


typedef enum {
    START, GAME, PAUSED
} GameState;

typedef enum {
    TITLE
} MenuState;

extern GameState gameState;
extern int hOff;
extern int vOff;

extern ANISPRITE player;
extern const int playerMaxSpeed;


extern int debug;

void init();

void initStart();
void initGame();
void initPause();
void setupBackground();

void update();

void updateStart();
void updateGame();
void updatePause();


void handleVBlank();
void setupInterrupts();
void interruptHandler();
# 5 "player.h" 2

extern ANISPRITE player;
extern const int playerMaxSpeed;

void initPlayer();
void updatePlayer();

void handlePlayerInput();
# 2 "player.c" 2

void initPlayer() {
    player.worldRow = ((487 - 16) << 8);
    player.worldCol = 0;
    player.screenRow = player.worldRow - vOff;
    player.screenCol = player.worldCol - hOff;
    player.rdel = 0;
    player.cdel = 0;
    player.width = ((16) << 8);
    player.height = ((16) << 8);
    player.hide = 0;

    shadowOAM[0].attr0 = ((player.screenRow) >> 8) | (0<<8) | (0<<13) | (0<<14);
    shadowOAM[0].attr1 = ((player.screenCol) >> 8) | (1<<14);
    shadowOAM[0].attr2 = ((0)*32+(0)) | ((0)<<12);
}

void updatePlayer() {
    if (!debug) {
        handlePlayerInput();
    }


    player.worldRow += player.rdel;
    player.worldCol += player.cdel;
    player.screenRow = player.worldRow - vOff;
    player.screenCol = player.worldCol - hOff;

    shadowOAM[0].attr0 = ((player.screenRow) >> 8) | (0<<8) | (0<<13) | (0<<14);
    shadowOAM[0].attr1 = ((player.screenCol) >> 8) | (1<<14);
    shadowOAM[0].attr2 = ((0)*32+(0)) | ((0)<<12);

    if (player.hide) {
        shadowOAM[0].attr0 |= (2<<8);
    }
}

void handlePlayerInput() {

}
