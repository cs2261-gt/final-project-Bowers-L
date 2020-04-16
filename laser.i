# 1 "laser.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "laser.c"
# 1 "laser.h" 1
       

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

int roundbase(int value, int base);
# 4 "laser.h" 2
# 1 "Spritesheet.h" 1
# 21 "Spritesheet.h"
extern const unsigned short SpritesheetTiles[16384];


extern const unsigned short SpritesheetPal[256];
# 5 "laser.h" 2
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
# 22 "InstructionsScreen.h"
extern const unsigned short InstructionsScreenTiles[2176];


extern const unsigned short InstructionsScreenMap[1024];


extern const unsigned short InstructionsScreenPal[256];
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

# 1 "item.h" 1
       
# 13 "item.h"
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

extern Item items[10];
extern ItemType playerInventory[10];

void initItem(Item* item, int col, int row, ItemType type);

void updateItem(Item* item);
void showItem(Item* item);

int checkCollisionPlayer(Item* item);

void equipItem(Item* item);
void useItem(ItemType item);
# 7 "player.h" 2

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
void equipBoots();
void equipLegs();
void equipGloves();
# 7 "game.h" 2
# 15 "game.h"
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
# 6 "laser.h" 2
# 16 "laser.h"
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

    int type;

    int index;
} Laser;

extern Laser lasers[50];

void initAllLasers();
void updateAllLasers();
void showAllLasers();

void initLaser(Laser* laser, int col, int row, int tall);
void updateLaser(Laser* laser);
void showLaser(Laser* laser);

void laserSling();
# 2 "laser.c" 2



Laser lasers[50];

void initAllLasers() {
    for (int i = 0; i < 50; i++) {
        lasers[i].active = 0;
    }

    for (int i = 0; i < 4; i++) {
        initLaser(&lasers[i], 376, 704 - i*16, 1);

    }
    for (int i = 4; i < 12; i++) {
        initLaser(&lasers[i], 64, 704 - (i-4)*16, 1);
        if (i != 4) {
            initLaser(&lasers[i+8], 80, 704 - (i-4)*16, 1);
        }
    }

    for (int i = 20; i < 39; i++) {
        initLaser(&lasers[i], 376 - (i-20)*16, 656, 3);
    }

    for (int i = 39; i < 42; i++) {
        initLaser(&lasers[i], 632 , 488 - (i-39)*16, 1);
    }

    for (int i = 42; i < 44; i++) {
        initLaser(&lasers[i], 664, 448 - (i - 42)*16, 1);
    }
    initLaser(&lasers[44], 632, 416, 1);



}

void initLaser(Laser* laser, int col, int row, int type) {
    static int laserCount = 0;

    laser->worldRow = ((row) << 4);
    laser->worldCol = ((col) << 4);
    laser->screenRow = laser->worldRow - camera.row;
    laser->screenCol = laser->worldCol - camera.col;
    if (laser->type == 3) {
        laser->width = ((16) << 4);
    } else {
        laser->width = ((8) << 4);
    }
    if (laser->type == 1) {
        laser->height = ((16) << 4);
    } else {
        laser->height = ((8) << 4);
    }
    laser->curFrame = 0;
    laser->numFrames = 60;
    laser->hide = 1;
    laser->active = 1;

    laser->type = type;

    laser->index = laserCount + 11;
    laserCount++;

    if (laser->type % 2 == 0) {

        shadowOAM[laser->index].attr0 = (((laser->screenRow) >> 4) & 0xFF) | (0<<8) | (0<<13) | (0<<14);
    } else {
        if (laser->type == 1) {

            shadowOAM[laser->index].attr0 = (((laser->screenRow) >> 4) & 0xFF) | (0<<8) | (0<<13) | (2<<14);
        } else {

            shadowOAM[laser->index].attr0 = (((laser->screenRow) >> 4) & 0xFF) | (0<<8) | (0<<13) | (1<<14);
        }

    }

    shadowOAM[laser->index].attr1 = (((laser->screenCol) >> 4) & 0x1FF) | (0<<14);

    if (laser->type > 1) {
        shadowOAM[laser->index].attr2 = (((laser->curFrame / (laser->numFrames / 4)))*32+(3)) | ((0)<<12);
    } else {
        shadowOAM[laser->index].attr2 = (((laser->curFrame / (laser->numFrames / 4)) * 2)*32+(2)) | ((0)<<12);
    }
}

void updateAllLasers() {
    for (int i = 0; i < 50; i++) {
        if (lasers[i].active) {
            updateLaser(&lasers[i]);
        }
    }
}

void updateLaser(Laser* laser) {


    laser->curFrame++;
    if (laser->curFrame >= laser->numFrames) {
        laser->curFrame = 0;
    }

    if (laser->hide == 0 && checkCollisionPlayerLaser(laser)) {
        if (laser->type > 1) {
            int direction = player.worldRow - laser->worldRow;
            player.worldRow += signOf(direction) * (((8) << 4));
            player.rdel = 0;
        } else {
            int direction = player.worldCol - laser->worldCol;
            player.worldCol += signOf(direction) * (((8) << 4));
            player.cdel = 0;
        }
    }
}

int checkCollisionPlayerLaser(Laser* laser) {
    return collision(player.worldCol, player.worldRow, player.width, player.height, laser->worldCol, laser->worldRow, laser->width, laser->height);
}

void showAllLasers() {
    for (int i = 0; i < 50; i++) {
        if (lasers[i].active) {
            showLaser(&lasers[i]);
        }
    }
}

void showLaser(Laser* laser) {
    laser->screenRow = laser->worldRow - camera.row;
    laser->screenCol = laser->worldCol - camera.col;


    if ((laser->screenRow < -laser->height) || (laser->screenRow > ((160 - 1) << 4))
        || (laser->screenCol < -laser->width) || (laser->screenCol > ((240 - 1) << 4))) {
        laser->hide = 1;
    } else {
        laser->hide = 0;
    }


    if (laser->type % 2 == 0) {

        shadowOAM[laser->index].attr0 = (((laser->screenRow) >> 4) & 0xFF) | (0<<8) | (0<<13) | (0<<14);
    } else {
        if (laser->type == 1) {

            shadowOAM[laser->index].attr0 = (((laser->screenRow) >> 4) & 0xFF) | (0<<8) | (0<<13) | (2<<14);
        } else {

            shadowOAM[laser->index].attr0 = (((laser->screenRow) >> 4) & 0xFF) | (0<<8) | (0<<13) | (1<<14);
        }

    }

    shadowOAM[laser->index].attr1 = (((laser->screenCol) >> 4) & 0x1FF) | (0<<14);

    if (laser->type > 1) {
        shadowOAM[laser->index].attr2 = (((laser->curFrame / (laser->numFrames / 4)))*32+(3)) | ((0)<<12);
    } else {
        shadowOAM[laser->index].attr2 = (((laser->curFrame / (laser->numFrames / 4)) * 2)*32+(2)) | ((0)<<12);
    }

    if (laser->hide) {
        shadowOAM[laser->index].attr0 |= (2<<8);
    }
}

void laserSling() {
    Laser* nearest = ((void*) 0);
    int minDistance = 2 * 1024;
    for (int i = 0; i < 50; i++) {
        if (lasers[i].active && !lasers[i].hide) {

            int distance;
            if (lasers[i].type > 1) {
                distance = lasers[i].worldRow - player.worldRow;
                if (distance < 16 && distance > -16) {
                    player.worldRow += 2 * distance;
                    break;
                }
            } else {
                distance = lasers[i].worldCol - player.worldCol;
                if (distance < ((16) << 4) && distance > -((16) << 4)) {
                    player.worldCol += 2 * distance;
                    break;
                }
            }
        }
    }
}
