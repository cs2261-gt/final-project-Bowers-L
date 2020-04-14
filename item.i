# 1 "item.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "item.c"
# 1 "item.h" 1
       

# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 66 "myLib.h"
extern unsigned short *videoBuffer;
# 90 "myLib.h"
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
# 162 "myLib.h"
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
# 205 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;





void updateInput();
# 224 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 264 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 358 "myLib.h"
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
int lerp(int a, int b, int curr, int max);
# 4 "item.h" 2

# 1 "Spritesheet.h" 1
# 21 "Spritesheet.h"
extern const unsigned short SpritesheetTiles[16384];


extern const unsigned short SpritesheetPal[256];
# 6 "item.h" 2

# 1 "game.h" 1
       



# 1 "stateMachine.h" 1
       




# 1 "map.h" 1
# 22 "map.h"
extern const unsigned short mapTiles[1696];


extern const unsigned short mapMap[16384];


extern const unsigned short mapPal[256];
# 7 "stateMachine.h" 2
# 1 "SplashScreen.h" 1
# 22 "SplashScreen.h"
extern const unsigned short SplashScreen_StartTiles[1696];


extern const unsigned short SplashScreen_StartMap[1024];


extern const unsigned short SplashScreen_InstructionsTiles[1696];


extern const unsigned short SplashScreen_InstructionsMap[1024];


extern const unsigned short SplashScreenPal[256];
# 8 "stateMachine.h" 2
# 1 "InstructionsScreen.h" 1
# 21 "InstructionsScreen.h"
extern const unsigned short InstructionsScreenTiles[1776];


extern const unsigned short InstructionsScreenMap[1024];
# 9 "stateMachine.h" 2
# 1 "PauseScreen_Resume.h" 1
# 22 "PauseScreen_Resume.h"
extern const unsigned short PauseScreen_ResumeTiles[848];


extern const unsigned short PauseScreen_ResumeMap[1024];


extern const unsigned short PauseScreen_ResumePal[256];
# 10 "stateMachine.h" 2
# 1 "PauseScreen_Quit.h" 1
# 21 "PauseScreen_Quit.h"
extern const unsigned short PauseScreen_QuitTiles[848];


extern const unsigned short PauseScreen_QuitMap[1024];
# 11 "stateMachine.h" 2
# 1 "WinScreen.h" 1
# 22 "WinScreen.h"
extern const unsigned short WinScreenTiles[1232];


extern const unsigned short WinScreenMap[1024];


extern const unsigned short WinScreenPal[256];
# 12 "stateMachine.h" 2




typedef enum {
    SPLASH, INSTRUCTIONS, GAME, PAUSED, WIN
} GameState;

typedef enum {
    OPTSTART, OPTINST, OPTRESUME, OPTQUIT
} MenuState;

extern GameState gameState;
extern MenuState menuState;

void initSplash();
void initInstructions();
void initPause();
void initWin();

void updateSplash();
void updateInstructions();
void updatePause();
void updateWin();
# 6 "game.h" 2
# 1 "player.h" 1
       


# 1 "mapCollision.h" 1
# 20 "mapCollision.h"
extern const unsigned short mapCollisionBitmap[1048576];
# 5 "player.h" 2


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
# 7 "game.h" 2
# 1 "camera.h" 1
       
# 10 "camera.h"
typedef struct {

    int row;
    int col;



    int sbbrow;
    int sbbcol;
} Camera;

extern Camera camera;


void initCamera();
void updateCamera();

void cameraDebug();
void centerCameraToPlayer();

void updateSBB();
# 8 "game.h" 2






extern int debug;

void init();
void update();

void initGame();
void resumeGame();
void updateGame();

void drawGame();

void setupMap();



void setupDisplayInterrupt();
void interruptHandler();
# 8 "item.h" 2



typedef enum {
    BOOTS
} ItemType;

typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int width;
    int height;
    int curFrame;
    int numFrames;
    int hide;

    u16 color1;
    u16 color2;
} Item;

extern Item boots;

void initItem(Item* item, int col, int row);

void updateItem(Item* item);
void showItem(Item* item);
# 2 "item.c" 2

Item boots;

void initItem(Item* item, int col, int row) {
    item->worldRow = ((row) << 4);
    item->worldCol = ((col) << 4);
    item->screenRow = item->worldRow - camera.row;
    item->screenCol = item->worldCol - camera.col;
    item->width = ((8) << 4);
    item->height = ((8) << 4);
    item->curFrame = 0;
    item->numFrames = 60;
    item->hide = 1;

    item->color1 = ((16) | (16)<<5 | (16)<<10);
    item->color2 = ((27) | (27)<<5 | (0)<<10);

    shadowOAM[1].attr0 = (((item->screenRow) >> 4) & 0xFF) | (0<<8) | (0<<13) | (0<<14);
    shadowOAM[1].attr1 = (((item->screenCol) >> 4) & 0x1FF) | (0<<14);
    shadowOAM[1].attr2 = ((0)*32+(9)) | ((0)<<12);
}

void updateItem(Item* item) {

    if (item->curFrame > item->numFrames / 2) {
        ((unsigned short *)0x5000200)[4] = ((lerp(27, 16, item->curFrame, item->numFrames / 2)) | (lerp(27, 16, item->curFrame, item->numFrames / 2))<<5 | (0)<<10)


                                 ;
    } else {
        ((unsigned short *)0x5000200)[4] = ((lerp(16, 27, item->curFrame, item->numFrames / 2)) | (lerp(16, 27, item->curFrame, item->numFrames / 2))<<5 | (lerp(16, 0, item->curFrame, item->numFrames / 2))<<10)


                                 ;
    }


    item->curFrame++;
    if (item->curFrame > item->numFrames) {
        item->curFrame = 0;
    }
}

void showItem(Item* item) {
    item->screenRow = item->worldRow - camera.row;
    item->screenCol = item->worldCol - camera.col;


    if ((item->screenRow < -item->height) || (item->screenRow > ((160 - 1) << 4))
        || (item->screenCol < -item->width) || (item->screenCol > ((240 - 1) << 4))) {
        item->hide = 1;
    } else {
        item->hide = 0;
    }


    shadowOAM[1].attr0 = (((item->screenRow) >> 4) & 0xFF) | (0<<8) | (0<<13) | (0<<14);
    shadowOAM[1].attr1 = (((item->screenCol) >> 4) & 0x1FF) | (0<<14);
    shadowOAM[1].attr2 = ((8)*32+(0)) | ((0)<<12);

    if (item->hide) {
        shadowOAM[1].attr0 |= (2<<8);
    }
}
