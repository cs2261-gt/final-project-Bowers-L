# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "game.h" 1
       

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
# 4 "game.h" 2
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
# 1 "player.h" 1
       




extern ANISPRITE player;
extern const int playerMaxSpeed;

void initPlayer();
void updatePlayer();

void handlePlayerInput();
# 7 "game.h" 2

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
# 2 "game.c" 2

GameState gameState;
int hOff;
int vOff;

ANISPRITE player;
const int playerMaxSpeed = 2;

int debug;

void init() {
    (*(unsigned short *)0x4000000) = 0;
    setupInterrupts();
    initGame();
}

void initGame() {

    gameState = GAME;
    hOff = 0;
    vOff = ((512 - 160) << 8);
    debug = 1;


    (*(unsigned short *)0x4000000) |= (1<<8);
    (*(volatile unsigned short*)0x4000008) = (0<<7) | (3<<14) | ((0)<<2) | ((28)<<8);
    DMANow(3, mapTiles, &((charblock *)0x6000000)[0], 992 / 2);
    DMANow(3, mapMap, &((screenblock *)0x6000000)[28], 8192 / 2);
    DMANow(3, mapPal, ((unsigned short *)0x5000000), 512 / 2);


    (*(unsigned short *)0x4000000) |= (1<<12);
    hideSprites();
    DMANow(3, SpritesheetTiles, &((charblock *)0x6000000)[4], 32768 / 2);
    DMANow(3, SpritesheetPal, ((unsigned short *)0x5000200), 512 / 2);

    initPlayer();
}

void update() {
    updateInput();
    switch (gameState) {
        case START:
            updateStart();
            break;
        case GAME:
            updateGame();
            break;
        case PAUSED:
            updatePause();
            break;
    }
}

void updateStart() {

}

void updateGame() {
    if (debug) {
        cameraDebug();
    }

    updatePlayer();
}



void updatePause() {

}

void cameraDebug() {
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<6)))) {
        if (vOff > 0) {
            vOff = max(vOff - playerMaxSpeed, 0);
        }
    }
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<7)))) {
        if (vOff < ((512 - 160) << 8)) {
            vOff = min(vOff + playerMaxSpeed, ((512 - 160) << 8));
        }
    }
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
        if (hOff > 0) {
            hOff = max(hOff - playerMaxSpeed, 0);
        }
    }
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
        if (hOff < ((512 - 240) << 8)) {
            hOff = min(hOff + playerMaxSpeed, ((512 - 240) << 8));
        }
    }
}

void handleVBlank() {
    (*(volatile unsigned short *)0x04000010) = ((hOff) >> 8);
    (*(volatile unsigned short *)0x04000012) = ((vOff) >> 8);
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
}

void setupInterrupts() {
    *(unsigned short*)0x4000208 = 0;
    *(unsigned int*)0x3007FFC = interruptHandler;


    *(unsigned short*)0x4000200 |= 1 << 0;
    *(unsigned short*)0x4000004 |= 1 << 3;

    *(unsigned short*)0x4000208 = 1;
}


void interruptHandler() {
    *(unsigned short*)0x4000208 = 0;

    if (*(volatile unsigned short*)0x4000202 & 1 << 0) {
        handleVBlank();
    }

    *(volatile unsigned short*)0x4000202 = *(volatile unsigned short*)0x4000202;

    *(unsigned short*)0x4000208 = 1;
}
