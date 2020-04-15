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
# 232 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;





void updateInput();
# 251 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 291 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 385 "myLib.h"
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

int round(int value, int base);
# 4 "item.h" 2

# 1 "Spritesheet.h" 1
# 21 "Spritesheet.h"
extern const unsigned short SpritesheetTiles[16384];


extern const unsigned short SpritesheetPal[256];
# 6 "item.h" 2

# 1 "camera.h" 1
       



# 1 "game.h" 1
       



# 1 "stateMachine.h" 1
       




# 1 "map.h" 1
# 22 "map.h"
extern const unsigned short mapTiles[272];


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


    int currentItem;
    int shrunk;
    int canWallJump;
} Player;


extern Player player;
extern const int playerMaxSpeed;

void initPlayer();
void updatePlayer();
void showPlayer();

void handlePlayerInput();


int collisionLeft();
int collisionRight();
int collisionAbove();
int collisionBelow();
int touchingGround();
int resolveCollisions();


void shrinkPlayer();
# 7 "game.h" 2


# 1 "laser.h" 1
       
# 12 "laser.h"
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
    int active;

    int tall;

    int index;
} Laser;

extern Laser lasers[30];

void initAllLasers();
void updateAllLasers();
void showAllLasers();

void initLaser(Laser* laser, int col, int row, int tall);
void updateLaser(Laser* laser);
void showLaser(Laser* laser);
# 10 "game.h" 2





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
# 6 "camera.h" 2




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
# 8 "item.h" 2





typedef enum {
    NONE, BOOTS, SHRINK, SPEED, GLOVES, Z
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
    int active;

    u16 color1;
    u16 color2;

    ItemType type;
    int index;
} Item;

extern Item items[5];
extern ItemType playerInventory[5];

void initItem(Item* item, int col, int row, ItemType type);

void updateItem(Item* item);
void showItem(Item* item);

int checkCollisionPlayer(Item* item);

void equipItem(Item* item);
void useItem(ItemType item);
# 2 "item.c" 2

Item items[5];

ItemType playerInventory[5];

void initAllItems() {
    for (int i = 0; i < 5; i++) {
        items[i].active = 0;
        playerInventory[i] = NONE;
    }

    initItem(&items[0], 1024 - 24, 1024 - 24, GLOVES);
    initItem(&items[1], 624, 904, SHRINK);
    initItem(&items[2], 24, 808, SPEED);
    initItem(&items[3], 1008, 800, GLOVES);
    initItem(&items[4], 224, 712, Z);
}

void initItem(Item* item, int col, int row, ItemType type) {
    static int itemCount = 0;
    itemCount++;

    item->worldRow = ((row) << 4);
    item->worldCol = ((col) << 4);
    item->screenRow = item->worldRow - camera.row;
    item->screenCol = item->worldCol - camera.col;
    item->width = ((8) << 4);
    item->height = ((8) << 4);
    item->curFrame = 0;
    item->numFrames = 60;
    item->hide = 1;
    item->active = 1;

    item->color1 = ((16) | (16)<<5 | (16)<<10);
    item->color2 = ((27) | (27)<<5 | (0)<<10);

    item->type = type;
    item->index = itemCount;

    shadowOAM[item->index].attr0 = (((item->screenRow) >> 4) & 0xFF) | (0<<8) | (0<<13) | (0<<14);
    shadowOAM[item->index].attr1 = (((item->screenCol) >> 4) & 0x1FF) | (0<<14);
    shadowOAM[item->index].attr2 = ((8)*32+(0)) | ((0)<<12);
}

void updateAllItems() {
    for (int i = 0; i < 5; i++) {
        if (items[i].active) {
            updateItem(&items[i]);
        }
    }
}

void updateItem(Item* item) {

    if (item->curFrame > item->numFrames / 2) {
        ((unsigned short *)0x5000200)[2] = ((lerp(27, 16, item->curFrame, item->numFrames / 2)) | (lerp(27, 16, item->curFrame, item->numFrames / 2))<<5 | (0)<<10)


                                 ;
    } else {
        ((unsigned short *)0x5000200)[2] = ((lerp(16, 27, item->curFrame, item->numFrames / 2)) | (lerp(16, 27, item->curFrame, item->numFrames / 2))<<5 | (lerp(16, 0, item->curFrame, item->numFrames / 2))<<10)


                                 ;
    }


    item->curFrame++;
    if (item->curFrame > item->numFrames) {
        item->curFrame = 0;
    }

    if (item->hide == 0 && checkCollisionPlayer(item)) {
        equipItem(item);
    }
}

int checkCollisionPlayer(Item* item) {
    return collision(player.worldCol, player.worldRow, player.width, player.height, item->worldCol, item->worldRow, item->width, item->height);
}

void showAllItems() {
    for (int i = 0; i < 5; i++) {
        if (items[i].active) {
            showItem(&items[i]);
        }
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


    shadowOAM[item->index].attr0 = (((item->screenRow) >> 4) & 0xFF) | (0<<8) | (0<<13) | (0<<14);
    shadowOAM[item->index].attr1 = (((item->screenCol) >> 4) & 0x1FF) | (0<<14);
    shadowOAM[item->index].attr2 = ((8)*32+(0)) | ((0)<<12);

    if (item->hide) {
        shadowOAM[item->index].attr0 |= (2<<8);
    }
}

void equipItem(Item* item) {
    item->active = 0;
    item->hide = 1;
    shadowOAM[item->index].attr0 |= (2<<8);

    int i = 0;
    while (playerInventory[i] != NONE) {
        i++;
    }
    playerInventory[i] = item->type;
}

void useItem(ItemType item) {
    switch (item) {
        case NONE:
            break;
        case BOOTS:
            equipBoots();
            break;
        case SHRINK:
            shrinkPlayer();
            break;
        case SPEED:
            equipLegs();
            break;
        case GLOVES:
            equipGloves();
            break;
    }
}
