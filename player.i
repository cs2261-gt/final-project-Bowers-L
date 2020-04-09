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
# 219 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 259 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 353 "myLib.h"
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
       




# 1 "map.h" 1
# 22 "map.h"
extern const unsigned short mapTiles[160];


extern const unsigned short mapMap[4096];


extern const unsigned short mapPal[256];
# 7 "game.h" 2
# 1 "SplashScreen.h" 1
# 22 "SplashScreen.h"
extern const unsigned short SplashScreen_StartTiles[1696];


extern const unsigned short SplashScreen_StartMap[1024];


extern const unsigned short SplashScreen_InstructionsTiles[1696];


extern const unsigned short SplashScreen_InstructionsMap[1024];


extern const unsigned short SplashScreenPal[256];
# 8 "game.h" 2
# 1 "PauseScreen_Resume.h" 1
# 22 "PauseScreen_Resume.h"
extern const unsigned short PauseScreen_ResumeTiles[848];


extern const unsigned short PauseScreen_ResumeMap[1024];


extern const unsigned short PauseScreen_ResumePal[256];
# 9 "game.h" 2
# 1 "PauseScreen_Quit.h" 1
# 21 "PauseScreen_Quit.h"
extern const unsigned short PauseScreen_QuitTiles[848];


extern const unsigned short PauseScreen_QuitMap[1024];
# 10 "game.h" 2
# 1 "Spritesheet.h" 1
# 21 "Spritesheet.h"
extern const unsigned short SpritesheetTiles[16384];


extern const unsigned short SpritesheetPal[256];
# 11 "game.h" 2





typedef enum {
    SPLASH, INSTRUCTIONS, GAME, PAUSED, WIN
} GameState;

typedef enum {
    OPTSTART, OPTINST, OPTRESUME, OPTQUIT
} MenuState;

extern GameState gameState;
extern int hOff;
extern int vOff;


extern int debug;

void init();

void initSplash();
void initInstructions();
void initGame();
void initPause();
void initWin();
void setupBackground();

void update();

void updateSplash();
void updateInstructions();
void updateGame();
void updatePause();
void updateWin();



void handleVBlank();
void setupDisplayInterrupt();
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
    int terminalVel;


    int isJumping;
    int jumpHeight;
    int jumpTime;
    int jumpSpeed;
    int gravity;

    int direction;
} Player;

extern Player player;
extern const int playerMaxSpeed;

void initPlayer();
void updatePlayer();
void showPlayer();

void handlePlayerInput();

void adjusthOff();
void adjustvOff();

int collisionLeft();
int collisionRight();
int collisionAbove();
int collisionBelow();

int resolveCollisionX();
int resolveCollisionY();
# 2 "player.c" 2

Player player;

void initPlayer() {
    player.worldRow = ((450) << 4);
    player.worldCol = ((15) << 4);
    player.screenRow = player.worldRow - vOff;
    player.screenCol = player.worldCol - hOff;
    player.rdel = 0;
    player.cdel = 0;
    player.width = ((8) << 4);
    player.height = ((16) << 4);
    player.hide = 0;

    player.raccel = 0;
    player.caccel = 0;

    player.accelCurve = 4;
    player.decelCurve = 8;
    player.maxSpeed = 16;
    player.terminalVel = 64;

    player.isJumping = 0;
    player.jumpHeight = 512;
    player.jumpTime = 16;

    player.gravity = (2 * player.jumpHeight) / (player.jumpTime * player.jumpTime);
    player.jumpSpeed = player.gravity * player.jumpTime;

    player.direction = 0;

    shadowOAM[0].attr0 = ((player.screenRow) >> 4) | (0<<8) | (0<<13) | (2<<14);
    shadowOAM[0].attr1 = ((player.screenCol) >> 4) | (0<<14);
    shadowOAM[0].attr2 = ((0)*32+(0)) | ((0)<<12);
}

void updatePlayer() {
    handlePlayerInput();


    if (collisionBelow()) {
        player.raccel = 0;
    } else {
        player.raccel = player.gravity;
    }


    player.rdel = clamp(player.rdel + player.raccel, -player.jumpSpeed, player.terminalVel);
    player.cdel = clamp(player.cdel + player.caccel, -player.maxSpeed, player.maxSpeed);


    player.worldCol = clamp(player.worldCol + player.cdel, 0, ((512) << 4) - player.width);
    resolveCollisionX();
    adjusthOff();

    player.worldRow = clamp(player.worldRow + player.rdel, 0, ((512) << 4) - player.height);
    resolveCollisionY();
    adjustvOff();

    showPlayer();
}

void showPlayer() {

    player.screenRow = player.worldRow - vOff;
    player.screenCol = player.worldCol - hOff;

    if ((player.screenRow < -player.height) || (player.screenRow > ((160 - 1) << 4))
        || (player.screenCol < -player.width) || (player.screenCol > ((240 - 1) << 4))) {
        player.hide = 1;
    } else {
        player.hide = 0;
    }

    shadowOAM[0].attr0 = (((player.screenRow) >> 4) & 0xFF) | (0<<8) | (0<<13) | (2<<14);
    shadowOAM[0].attr1 = (((player.screenCol) >> 4) & 0x1FF) | (0<<14);
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
            if (player.worldCol < ((512) << 4) - player.width) {
                player.caccel = player.accelCurve;
            }
        }
    }

    if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
        if (collisionBelow()) {
            player.isJumping = 1;
            player.rdel = -player.jumpSpeed;
        }
    }

    if (!(~((*(volatile unsigned short *)0x04000130)) & ((1<<0)))) {
        if (player.isJumping) {
            player.rdel = 0;
            player.isJumping = 0;
        }
    }
}
# 145 "player.c"
int collisionLeft() {
    return player.worldCol < 0
        || mapCollisionBitmap[((((player.worldRow) >> 4))*(512)+(((player.worldCol) >> 4)))]
        || mapCollisionBitmap[((((player.worldRow + player.height - 1) >> 4))*(512)+(((player.worldCol) >> 4)))];
}

int collisionRight() {
    return player.worldCol + player.width >= ((512) << 4)
        || mapCollisionBitmap[((((player.worldRow) >> 4))*(512)+(((player.worldCol + player.width - 1) >> 4)))]
        || mapCollisionBitmap[((((player.worldRow + player.height - 1) >> 4))*(512)+(((player.worldCol + player.width - 1) >> 4)))];
}

int collisionAbove() {
    return player.worldRow < 0
        || mapCollisionBitmap[((((player.worldRow) >> 4))*(512)+(((player.worldCol) >> 4)))]
        || mapCollisionBitmap[((((player.worldRow) >> 4))*(512)+(((player.worldCol + player.width - 1) >> 4)))];
}

int collisionBelow() {
    return player.worldRow + player.height >= ((512) << 4)
        || mapCollisionBitmap[((((player.worldRow + player.height - 1) >> 4))*(512)+(((player.worldCol) >> 4)))]
        || mapCollisionBitmap[((((player.worldRow + player.height - 1) >> 4))*(512)+(((player.worldCol + player.width - 1) >> 4)))];
}

int resolveCollisionX() {

    while (collisionLeft()) {
        player.worldCol++;
        player.cdel = 0;
    }

    while (collisionRight()) {
        player.worldCol--;
        player.cdel = 0;
    }
}

int resolveCollisionY() {
    while (collisionAbove()) {
        player.rdel = 0;
        player.worldRow++;
    }

    while (collisionBelow()) {
        player.rdel = 0;
        player.worldRow--;
    }
}

void adjusthOff() {
    if (player.cdel < 0) {

        if ((hOff > 0) && (player.screenCol + player.width / 2 < ((240 / 2) << 4))) {
            hOff = max(hOff + player.cdel, 0);
        }
    } else if (player.cdel > 0) {

        if ((hOff + ((240 - 1) << 4) < ((512) << 4)) && (player.screenCol + player.width / 2 > ((240 / 2) << 4))) {
            hOff = min(hOff + player.cdel, ((512 - 240) << 4));
        }
    }
}

void adjustvOff() {
    if (player.rdel < 0) {

        if ((vOff > 0) && (player.screenRow + player.height / 2 < ((160 / 2) << 4))) {
            vOff = max(vOff + player.rdel, 0);
        }
    } else if (player.rdel > 0) {
        if ((vOff + ((160 - 1) << 4) < ((512) << 4)) && (player.screenRow + player.height / 2 > ((160 / 2) << 4))) {
            vOff = min(vOff + player.rdel, ((512 - 160) << 4));
        }
    }
}
