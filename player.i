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
int clamp(int value, int min, int max);
int signOf(int value);
# 4 "player.h" 2
# 1 "mapCollision.h" 1
# 20 "mapCollision.h"
extern const unsigned short mapCollisionBitmap[262144];
# 5 "player.h" 2
# 1 "game.h" 1
       


# 1 "Spritesheet.h" 1
# 21 "Spritesheet.h"
extern const unsigned short SpritesheetTiles[16384];


extern const unsigned short SpritesheetPal[256];
# 5 "game.h" 2
# 1 "map.h" 1
# 24 "map.h"
extern const unsigned short mapTiles[400];


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
# 6 "player.h" 2

typedef enum {
    LEFT, RIGHT
} PlayerState;

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

    int raccel;
    int caccel;

    int accelCurve;
    int decelCurve;
    int maxSpeed;

    int isJumping;
    int jumpCounter;
    int jumpSpeed;
    int maxJump;
    int terminalVel;
    int gravity;

    int direction;
} Player;

extern Player player;
extern const int playerMaxSpeed;

void initPlayer();
void updatePlayer();

void handlePlayerInput();

void adjusthOff();
void adjustvOff();

int playerInAir();
int noCollisionLeft();
int noCollisionRight();
# 2 "player.c" 2

Player player;

void initPlayer() {
    player.worldRow = ((487 - 16) << 8);
    player.worldCol = ((1) << 8);
    player.screenRow = player.worldRow - vOff;
    player.screenCol = player.worldCol - hOff;
    player.rdel = 0;
    player.cdel = 0;
    player.width = ((8) << 8);
    player.height = ((16) << 8);
    player.hide = 0;

    player.raccel = 0;
    player.caccel = 0;

    player.accelCurve = 64;
    player.decelCurve = 128;
    player.maxSpeed = 256;

    player.isJumping = 0;
    player.jumpCounter = 0;
    player.jumpSpeed = 256;
    player.maxJump = 128
    ;
    player.terminalVel = 256;
    player.gravity = 64;

    player.direction = 0;

    shadowOAM[0].attr0 = ((player.screenRow) >> 8) | (0<<8) | (0<<13) | (2<<14);
    shadowOAM[0].attr1 = ((player.screenCol) >> 8) | (0<<14);
    shadowOAM[0].attr2 = ((0)*32+(0)) | ((0)<<12);
}

void updatePlayer() {
    if (!debug) {
        handlePlayerInput();
    }


    if (onGround() || player.isJumping) {
        player.raccel = 0;
    } else {
        player.raccel = player.gravity;
    }


    player.rdel = clamp(player.rdel + player.raccel, -player.jumpSpeed, player.terminalVel);
    player.cdel = clamp(player.cdel + player.caccel, -player.maxSpeed, player.maxSpeed);


    if ((noCollisionLeft() && player.cdel < 0)
        || (noCollisionRight() && player.cdel > 0)) {

            player.worldCol = clamp(player.worldCol + player.cdel, 0, ((512) << 8) - player.width);
            adjusthOff();
    } else {
        player.cdel = 0;
        player.caccel = 0;
    }

    if ((noCollisionUp() && player.rdel < 0)
        || (noCollisionDown() && player.rdel > 0)) {

            player.worldRow = clamp(player.worldRow + player.rdel, 0, ((512) << 8) - player.height);
            adjustvOff();
    } else {
        player.rdel = 0;
        if (onGround()) {
            player.raccel = 0;
        } else {
            player.raccel = player.gravity;
        }
    }

    player.worldRow = clamp(player.worldRow + player.rdel, 0, ((512) << 8) - player.height);

    player.screenRow = player.worldRow - vOff;
    player.screenCol = player.worldCol - hOff;

    shadowOAM[0].attr0 = ((player.screenRow) >> 8) | (0<<8) | (0<<13) | (2<<14);
    shadowOAM[0].attr1 = ((player.screenCol) >> 8) | (0<<14);
    shadowOAM[0].attr2 = ((0)*32+(0)) | ((0)<<12);

    if (player.hide) {
        shadowOAM[0].attr0 |= (2<<8);
    }
}

void handlePlayerInput() {
    if (!(~((*(volatile unsigned short *)0x04000130)) & ((1<<5))) && !(~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {

        if (signOf(player.direction) == signOf(player.cdel)) {

            player.caccel = -1 * signOf(player.direction) * player.decelCurve;
        } else {
            player.cdel = 0;
            player.caccel = 0;
        }
    } else {
        if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
            player.direction = -1;
            if (player.worldCol > 0) {
                player.caccel = -player.accelCurve;
            }
        }
        if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
            player.direction = 1;
            if (player.worldCol < ((512) << 8) - player.width) {
                player.caccel = player.accelCurve;
            }
        }
    }

    if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
        if (onGround()) {
            player.isJumping = 1;
            player.jumpCounter = 0;
        }
    }

    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<0)))) {
        if (player.jumpCounter == 0) {
            player.isJumping = 1;
        }

        if (player.jumpCounter >= player.maxJump) {
            player.isJumping = 0;
        } else if (player.isJumping) {
            player.rdel = -player.jumpSpeed;
            player.jumpCounter++;
        }
    }
}

int noCollisionLeft() {
    return player.worldCol > 0
        && mapCollisionBitmap[((((player.worldRow) >> 8))*(512)+(((player.worldCol + player.cdel) >> 8)))]
        && mapCollisionBitmap[((((player.worldRow + player.height - 1) >> 8))*(512)+(((player.worldCol + player.cdel) >> 8)))];
}

int noCollisionRight() {
    return player.worldCol + player.width < ((512) << 8)
        && mapCollisionBitmap[((((player.worldRow) >> 8))*(512)+(((player.worldCol + player.cdel + player.width - 1) >> 8)))]
        && mapCollisionBitmap[((((player.worldRow + player.height - 1) >> 8))*(512)+(((player.worldCol + player.cdel + player.width - 1) >> 8)))];
}

int noCollisionUp() {
    return player.worldRow > 0
        && mapCollisionBitmap[((((player.worldRow + player.rdel) >> 8))*(512)+(((player.worldCol) >> 8)))]
        && mapCollisionBitmap[((((player.worldRow + player.rdel) >> 8))*(512)+(((player.worldCol + player.width - 1) >> 8)))];
}

int noCollisionDown() {
    return player.worldRow < ((512) << 8)
        && mapCollisionBitmap[((((player.worldRow + player.rdel + player.height - 1) >> 8))*(512)+(((player.worldCol) >> 8)))]
        && mapCollisionBitmap[((((player.worldRow + player.rdel + player.height - 1) >> 8))*(512)+(((player.worldCol + player.width - 1) >> 8)))];
}

int onGround() {
    return mapCollisionBitmap[((((player.worldRow + player.height) >> 8))*(512)+(((player.worldCol) >> 8)))]
        && mapCollisionBitmap[((((player.worldRow + player.height) >> 8))*(512)+(((player.worldCol + player.width - 1) >> 8)))];
}

void adjusthOff() {
    if (player.cdel < 0) {
        if ((hOff > 0) && (player.screenCol + player.width / 2 < ((240 / 2) << 8))) {
            hOff = max(hOff + player.cdel, 0);
        }
    } else if (player.cdel > 0) {
        if ((hOff + ((240 - 1) << 8) < ((512) << 8)) && (player.screenCol + player.width / 2 > ((240 / 2) << 8))) {
            hOff = min(hOff + player.cdel, ((512 - 240) << 8));
        }
    }
}

void adjustvOff() {
    if (player.rdel < 0) {
        if ((vOff > 0) && (player.screenRow + player.height / 2 < ((160 / 2) << 8))) {
            hOff += player.cdel;
        }
    } else if (player.rdel > 0) {
        if ((vOff + ((240 - 1) << 8) < ((512) << 8)) && (player.screenRow + player.height / 2 > ((160 / 2) << 8))) {
            vOff += player.rdel;
        }
    }
}
